import 'package:flutter/material.dart';
import 'package:app_lista_compras/pages/novo_produto.dart';
import 'package:app_lista_compras/components/lista_item.dart';
import 'package:app_lista_compras/components/appbar.dart';
import 'package:app_lista_compras/styles/colors.dart';
import 'package:app_lista_compras/utils/data_teste.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarHeader(titulo: "Lista"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 24),
          // padding: const EdgeInsets.symmetric(vertical: 24),
          itemCount: listaTeste.length,
          itemBuilder: (context, index) {
            return ListaItem(
              id: index,
              nome: listaTeste[index],
              quantidade: num.parse(listaTeste[index]),
              unidade: listaTeste[index],
            );
          },
        ),
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
