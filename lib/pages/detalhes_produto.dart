import 'package:flutter/material.dart';
import 'package:app_lista_compras/components/item_detalhes.dart';
import 'package:app_lista_compras/components/appbar.dart';
import 'package:app_lista_compras/components/botao.dart';
import 'package:app_lista_compras/styles/colors.dart';
import 'package:app_lista_compras/models/produto_model.dart';
import 'package:app_lista_compras/utils/data_teste.dart';
import 'package:app_lista_compras/utils/helpers.dart';

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
    Produto produto = produtoTeste2.firstWhere(
      (item) => item.id == widget.id,
      orElse: () => Produto(
        id: 0,
        nome: "nome",
        quantidade: 0,
        unidade: "unidade",
        categoria: "categoria",
        descricao: "descricao",
        ativo: true,
      ),
    );

    return Scaffold(
      appBar: const AppBarHeader(
        titulo: "Detalhes",
        exibeBusca: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 32),
              ItemDetalhes(
                margin: const EdgeInsets.only(bottom: 16),
                titulo: "ID",
                descricao: widget.id.toString(),
              ),
              ItemDetalhes(
                margin: const EdgeInsets.only(bottom: 16),
                titulo: "Nome",
                descricao: produto.nome,
                // descricao: produtoTeste["nome"],
              ),
              ItemDetalhes(
                margin: const EdgeInsets.only(bottom: 16),
                titulo: "Quantidade",
                descricao: formataQuantidadeUnidade(
                  quantidade: produto.quantidade,
                  unidade: produto.unidade,
                ),
                // descricao: formataQuantidadeUnidade(
                //   quantidade: produtoTeste["quantidade"],
                //   unidade: produtoTeste["unidade"],
                // ),
              ),
              ItemDetalhes(
                margin: const EdgeInsets.only(bottom: 16),
                titulo: "Categoria",
                descricao: produto.categoria,
                // descricao: produtoTeste["categoria"],
              ),
              ItemDetalhes(
                margin: const EdgeInsets.only(bottom: 16),
                titulo: "Descrição",
                descricao: produto.descricao,
                // descricao: produtoTeste["descricao"],
              ),
              ItemDetalhes(
                margin: const EdgeInsets.only(bottom: 16),
                titulo: "Ativo",
                descricao: (produto.ativo == false) ? "Não" : "Sim",
                // descricao: (produtoTeste["ativo"] == false) ? "Não" : "Sim",
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
