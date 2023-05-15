import 'package:app_lista_compras/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum ItemMenu2Enum { exibir, editar, remover }

class MenuSelecionadoProvider with ChangeNotifier {
  ItemMenu2Enum _itemSelecionado = ItemMenu2Enum.exibir;

  ItemMenu2Enum get itemSelecionado => _itemSelecionado;

  set itemSelecionado(ItemMenu2Enum novoItem) {
    _itemSelecionado = novoItem;
    notifyListeners();
  }
}

class Teste1 extends StatefulWidget {
  const Teste1({super.key});

  @override
  State<Teste1> createState() => _Teste1State();
}

class _Teste1State extends State<Teste1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: azul1,
        toolbarHeight: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const Text("data"),
            Center(
              child: Consumer<MenuSelecionadoProvider>(
                builder: (context, menuSelecionado, widget) =>
                    PopupMenuButton<ItemMenu2Enum>(
                  onSelected: (ItemMenu2Enum resultado) {
                    menuSelecionado.itemSelecionado = resultado;
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<ItemMenu2Enum>>[
                    const PopupMenuItem<ItemMenu2Enum>(
                      value: ItemMenu2Enum.exibir,
                      child: Text('Exibir'),
                    ),
                    const PopupMenuItem<ItemMenu2Enum>(
                      value: ItemMenu2Enum.editar,
                      child: Text('Editar'),
                    ),
                    const PopupMenuItem<ItemMenu2Enum>(
                      value: ItemMenu2Enum.remover,
                      child: Text('Remover'),
                    ),
                  ],
                  // child: ListTile(
                  //   title: const Text('PopupMenuButton com Provider e Enum'),
                  //   subtitle: Text(
                  //       'Item Selecionado: ${menuSelecionado.itemSelecionado.toString()}'),
                  //   trailing: const Icon(Icons.arrow_drop_down),
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
