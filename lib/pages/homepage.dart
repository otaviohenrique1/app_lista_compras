import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_lista_compras/pages/novo_produto.dart';
import 'package:app_lista_compras/components/lista_item.dart';
import 'package:app_lista_compras/components/appbar.dart';
import 'package:app_lista_compras/provider/produto_provider.dart';
import 'package:app_lista_compras/styles/colors.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarHeader(
        titulo: "Lista",
        exibeBusca: true,
      ),
      body: Consumer<ProdutoProvider>(
        builder: (BuildContext context, ProdutoProvider produtoProviderConsumer,
            Widget? widget) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 24),
              itemCount: produtoProviderConsumer.listaProdutos.length,
              itemBuilder: (context, index) {
                return ListaItem(
                  id: produtoProviderConsumer.listaProdutos[index].id,
                  nome: produtoProviderConsumer.listaProdutos[index].nome,
                  quantidade:
                      produtoProviderConsumer.listaProdutos[index].quantidade,
                  unidade: produtoProviderConsumer.listaProdutos[index].unidade,
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NovoProduto(),
            ),
          );
        },
        backgroundColor: azul1,
        tooltip: "Adicionar produto",
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: branco,
          size: 40,
        ),
      ),
    );
  }
}
