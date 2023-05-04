import 'package:app_lista_compras/components/appbar.dart';
import 'package:app_lista_compras/components/campo_checkbox.dart';
import 'package:app_lista_compras/components/select.dart';
import 'package:app_lista_compras/pages/homepage.dart';
import 'package:app_lista_compras/styles/listas.dart';
import 'package:flutter/material.dart';
import 'package:app_lista_compras/components/botao.dart';
import 'package:app_lista_compras/components/campo_texto.dart';
import 'package:app_lista_compras/styles/colors.dart';
import 'package:app_lista_compras/utils/validator.dart';

class NovoProduto extends StatefulWidget {
  const NovoProduto({super.key});

  @override
  State<NovoProduto> createState() => _NovoProdutoState();
}

class _NovoProdutoState extends State<NovoProduto> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  // final TextEditingController _precoController = TextEditingController();
  final TextEditingController _categoriaController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();

  String dropdownValueUnidadeQuantidade = unidadeQuantidade.first;

  @override
  void dispose() {
    _nomeController.dispose();
    // _precoController.dispose();
    _categoriaController.dispose();
    _quantidadeController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  bool isSelected = true;
  // bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarHeader(titulo: "Novo produto"),
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
                // const SizedBox(height: 24),
                // CampoTexto(
                //   label: "Preço (R\$)",
                //   hintText: "Insira o preço do produto",
                //   controller: _precoController,
                //   exibeLabel: true,
                //   keyboardType: TextInputType.number,
                //   obscureText: false,
                //   validator: validaCampoVazio,
                // ),
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
                        validator: (value) {
                          if (value == null || value == "Selecione") {
                            return "Valor inválido";
                          }
                          return null;
                        },
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
                ),
                const SizedBox(height: 24),
                CampoCheckbox(
                  item: CheckboxModel(
                    texto: "Ativo",
                    // texto: "Incluir na lista?",
                    checked: isSelected,
                  ),
                ),
                const SizedBox(height: 32),
                Botao(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Homepage()));
                    }
                  },
                  label: "Salvar",
                  backgroundColor: azul1,
                  fontColor: branco,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
