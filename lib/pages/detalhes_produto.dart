import 'package:app_lista_compras/provider/produto_provider.dart';
import 'package:app_lista_compras/utils/produto_data.dart';
import 'package:flutter/material.dart';
import 'package:app_lista_compras/components/item_detalhes.dart';
import 'package:app_lista_compras/components/appbar.dart';
import 'package:app_lista_compras/components/botao.dart';
import 'package:app_lista_compras/styles/colors.dart';
import 'package:app_lista_compras/models/produto_model.dart';
import 'package:app_lista_compras/utils/helpers.dart';
import 'package:provider/provider.dart';

class DetalhesProduto extends StatefulWidget {
  const DetalhesProduto({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<DetalhesProduto> createState() => _DetalhesProdutoState();
}

class _DetalhesProdutoState extends State<DetalhesProduto> {
  @override
  Widget build(BuildContext context) {
    ProdutoProvider produtoProvider =
        Provider.of<ProdutoProvider>(context, listen: false);
    ProdutoModel produto = produtoProvider.findById(widget.id);

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
              ),
              ItemDetalhes(
                margin: const EdgeInsets.only(bottom: 16),
                titulo: "Categoria",
                descricao: produto.categoria,
              ),
              ItemDetalhes(
                margin: const EdgeInsets.only(bottom: 16),
                titulo: "Descrição",
                descricao: produto.descricao,
              ),
              ItemDetalhes(
                margin: const EdgeInsets.only(bottom: 16),
                titulo: "Ativo",
                descricao: (produto.ativo == false) ? "Não" : "Sim",
              ),
              const SizedBox(height: 32),
              Botao(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetalhesProduto(id: widget.id)));
                },
                label: "Editar",
                backgroundColor: azul1,
                fontColor: branco,
              ),
              Consumer(
                builder: (BuildContext context,
                    ProdutoProvider produtoProviderConsumer, Widget? child) {
                  return Botao(
                    onPressed: () {
                      produtoProviderConsumer.delete(widget.id);
                      Navigator.pop(context);
                    },
                    label: "remover",
                    backgroundColor: azul1,
                    fontColor: branco,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
