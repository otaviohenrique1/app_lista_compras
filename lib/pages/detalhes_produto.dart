import 'package:app_lista_compras/utils/produto_data.dart';
import 'package:flutter/material.dart';
import 'package:app_lista_compras/components/item_detalhes.dart';
import 'package:app_lista_compras/components/appbar.dart';
import 'package:app_lista_compras/components/botao.dart';
import 'package:app_lista_compras/styles/colors.dart';
import 'package:app_lista_compras/models/produto_model.dart';
// import 'package:app_lista_compras/utils/data_teste.dart';
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
    ProdutoData2 listTypes = Provider.of<ProdutoData2>(context, listen: false);
    ProdutoModel produto = listTypes.buscaProduto(widget.id);

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
            ],
          ),
        ),
      ),
    );
  }
}
