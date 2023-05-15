import 'package:flutter/material.dart';
import 'package:app_lista_compras/components/appbar.dart';
import 'package:app_lista_compras/components/campo_checkbox.dart';
import 'package:app_lista_compras/components/select.dart';
import 'package:app_lista_compras/components/botao.dart';
import 'package:app_lista_compras/components/campo_texto.dart';
import 'package:app_lista_compras/styles/listas.dart';
import 'package:app_lista_compras/styles/colors.dart';
import 'package:app_lista_compras/utils/validator.dart';
import 'package:app_lista_compras/utils/produto_data.dart';
import 'package:app_lista_compras/models/produto_model.dart';
import 'package:provider/provider.dart';

class EditarProduto extends StatefulWidget {
  const EditarProduto({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<EditarProduto> createState() => _EditarProdutoState();
}

class _EditarProdutoState extends State<EditarProduto> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _categoriaController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _categoriaController.dispose();
    _quantidadeController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  // String dropdownValueUnidadeQuantidade = unidadeQuantidade.first;

  // bool isSelected = true;
  // bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    ProdutoData2 listTypes = Provider.of<ProdutoData2>(context, listen: false);
    ProdutoModel produto = listTypes.buscaProduto(widget.id);

    _nomeController.text = produto.nome;
    _quantidadeController.text = produto.quantidade.toString();
    _categoriaController.text = produto.categoria;
    _descricaoController.text = produto.descricao;
    bool isSelected = produto.ativo;
    String dropdownValueUnidadeQuantidade = produto.unidade;

    return Scaffold(
      appBar: const AppBarHeader(
        titulo: "Editar produto",
        exibeBusca: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CampoTexto(
                  label: "Nome",
                  hintText: "Insira o nome do produto",
                  controller: _nomeController,
                  exibeLabel: true,
                  keyboardType: TextInputType.text,
                  validator: validaCampoVazio,
                  obscureText: false,
                ),
                const SizedBox(height: 24),
                CampoTexto(
                  label: "Categoria",
                  hintText: "Insira a categoria do produto",
                  controller: _categoriaController,
                  exibeLabel: true,
                  keyboardType: TextInputType.text,
                  validator: validaCampoVazio,
                  obscureText: false,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: CampoTexto(
                        label: "Quantidade",
                        hintText: "Insira a quantidade",
                        controller: _quantidadeController,
                        exibeLabel: true,
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        validator: validaCampoVazio,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Select(
                        exibeLabel: true,
                        label: "Unidade",
                        lista: unidadeQuantidade,
                        dropdownValue: dropdownValueUnidadeQuantidade,
                        onChanged: (value) async {
                          setState(() {
                            dropdownValueUnidadeQuantidade = value!;
                          });
                        },
                        validator: (value) => validaSelect(
                          value: value,
                          primeiroValorSelect: "Selecione",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                CampoTexto(
                  label: "Descrição",
                  hintText: "Insira a descrição do produto",
                  controller: _descricaoController,
                  exibeLabel: true,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  validator: validaCampoVazio,
                  maxLines: 10,
                ),
                const SizedBox(height: 24),
                CampoCheckbox(
                  item: CheckboxModel(
                    texto: "Ativo",
                    checked: isSelected,
                  ),
                ),
                const SizedBox(height: 32),
                Consumer(
                  builder: (BuildContext context, ProdutoData2 lista,
                      Widget? child) {
                    return Botao(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          lista.editarProduto(
                            widget.id,
                            ProdutoModel(
                              id: widget.id,
                              nome: _nomeController.text,
                              quantidade: num.parse(_quantidadeController.text),
                              unidade: dropdownValueUnidadeQuantidade,
                              categoria: _categoriaController.text,
                              descricao: _descricaoController.text,
                              ativo: isSelected,
                              idUsuario: produto.idUsuario,
                              dataCriacao: produto.dataCriacao,
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                      label: "Salvar",
                      backgroundColor: azul1,
                      fontColor: branco,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
