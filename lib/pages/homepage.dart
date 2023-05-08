import 'package:flutter/material.dart';
import 'package:app_lista_compras/pages/novo_produto.dart';
import 'package:app_lista_compras/components/lista_item.dart';
import 'package:app_lista_compras/components/appbar.dart';
import 'package:app_lista_compras/styles/colors.dart';
import 'package:app_lista_compras/utils/produto_data.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<ProdutoData2>(
        builder: (BuildContext context, ProdutoData2 lista, Widget? widget) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 24),
              itemCount: lista.produtos.length,
              itemBuilder: (context, index) {
                return ListaItem(
                  id: lista.produtos[index].id,
                  nome: lista.produtos[index].nome,
                  quantidade: lista.produtos[index].quantidade,
                  unidade: lista.produtos[index].unidade,
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
