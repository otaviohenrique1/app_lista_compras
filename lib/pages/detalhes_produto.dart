import 'package:app_lista_compras/components/item_detalhes.dart';
import 'package:app_lista_compras/utils/data.dart';
import 'package:app_lista_compras/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:app_lista_compras/components/appbar.dart';
import 'package:app_lista_compras/components/botao.dart';
import 'package:app_lista_compras/styles/colors.dart';

class DetalhesProduto extends StatefulWidget {
  const DetalhesProduto({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<DetalhesProduto> createState() => _DetalhesProdutoState();
}

class _DetalhesProdutoState extends State<DetalhesProduto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarHeader(titulo: "Detalhes"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              ItemDetalhes(
                margin: const EdgeInsets.only(bottom: 16),
                titulo: "ID",
                descricao: widget.id.toString(),
              ),
              ItemDetalhes(
                margin: const EdgeInsets.only(bottom: 16),
                titulo: "Nome",
                descricao: produtoTeste["nome"],
              ),
              ItemDetalhes(
                margin: const EdgeInsets.only(bottom: 16),
                titulo: "Nome",
                descricao: formataQuantidadeUnidade(
                  quantidade: produtoTeste["quantidade"],
                  unidade: produtoTeste["unidade"],
                ),
              ),
              ItemDetalhes(
                margin: const EdgeInsets.only(bottom: 16),
                titulo: "Categoria",
                descricao: produtoTeste["categoria"],
              ),
              ItemDetalhes(
                margin: const EdgeInsets.only(bottom: 16),
                titulo: "Descrição",
                descricao: produtoTeste["descricao"],
              ),
              ItemDetalhes(
                margin: const EdgeInsets.only(bottom: 16),
                titulo: "Ativo",
                descricao:
                    (produtoTeste["ativo"] == false) ? "Inativo" : "Ativo",
              ),
              const SizedBox(height: 32),
              Botao(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const Homepage()));
                },
                label: "Editar",
                backgroundColor: azul1,
                fontColor: branco,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
