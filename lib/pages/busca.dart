import 'package:app_lista_compras/provider/produto_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_lista_compras/components/appbar.dart';
import 'package:app_lista_compras/components/campo_checkbox.dart';
import 'package:app_lista_compras/components/botao.dart';
import 'package:app_lista_compras/components/campo_texto.dart';
import 'package:app_lista_compras/styles/colors.dart';
import 'package:app_lista_compras/styles/listas.dart';
import 'package:app_lista_compras/utils/validator.dart';
import 'package:provider/provider.dart';

import '../models/produto_model.dart';

class Busca extends StatefulWidget {
  const Busca({super.key});

  @override
  State<Busca> createState() => _BuscaState();
}

class _BuscaState extends State<Busca> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController _buscaController = TextEditingController();

  String dropdownValueUnidadeQuantidade = unidadeQuantidade.first;

  @override
  void dispose() {
    _buscaController.dispose();
    super.dispose();
  }

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    String nome = _buscaController.text;
    ProdutoProvider listTypes =
        Provider.of<ProdutoProvider>(context, listen: false);
    ProdutoModel usuario = listTypes.findByName(nome);

    return Scaffold(
      appBar: const AppBarHeader(
        titulo: "Busca",
        exibeBusca: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CampoTexto(
                  hintText: "Insira o nome do produto",
                  controller: _buscaController,
                  exibeLabel: false,
                  keyboardType: TextInputType.text,
                  validator: validaCampoVazio,
                  obscureText: false,
                ),
                CampoCheckbox(
                  item: CheckboxModel(
                    texto: "Exibir itens ocultos",
                    checked: isSelected,
                  ),
                ),
                Botao(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      //
                    }
                  },
                  label: "Buscar",
                  backgroundColor: azul1,
                  fontColor: branco,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Divider(color: preto),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
