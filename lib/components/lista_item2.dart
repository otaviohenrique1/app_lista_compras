import 'package:app_lista_compras/pages/editar_produto.dart';
import 'package:app_lista_compras/utils/produto_data.dart';
import 'package:flutter/material.dart';
import 'package:app_lista_compras/pages/detalhes_produto.dart';
import 'package:app_lista_compras/styles/colors.dart';
import 'package:app_lista_compras/styles/fonts.dart';
import 'package:app_lista_compras/utils/helpers.dart';
import 'package:provider/provider.dart';

enum ItemMenu2Enum { exibir, editar, remover }

class MenuState with ChangeNotifier {
  ItemMenu2Enum _selectedOption = ItemMenu2Enum.exibir;

  ItemMenu2Enum get selectedOption => _selectedOption;

  set selectedOption(ItemMenu2Enum option) {
    _selectedOption = option;
    notifyListeners();
  }
}

class ListaItem2 extends StatefulWidget {
  const ListaItem2({
    super.key,
    required this.id,
    required this.nome,
    required this.quantidade,
    required this.unidade,
  });

  final String id;
  final String nome;
  final num quantidade;
  final String unidade;

  @override
  State<ListaItem2> createState() => _ListaItem2State();
}

class _ListaItem2State extends State<ListaItem2> {
  @override
  Widget build(BuildContext context) {
    ItemMenu2Enum? selectedMenu;

    String idProduto = widget.id;
    String nome = widget.nome;
    num quantidadeValor = widget.quantidade;
    String unidadeTexto = widget.unidade;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 16, right: 0),
        title: Text(nome, style: style18Regular),
        subtitle: Text(
          formataQuantidadeUnidade(
            quantidade: quantidadeValor,
            unidade: unidadeTexto,
          ),
          style: style16Regular,
        ),
        tileColor: cinza2,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: cinza1),
          borderRadius: BorderRadius.circular(2),
        ),
        trailing: PopupMenuButton<ItemMenu2Enum>(
          initialValue: selectedMenu,
          icon: const Icon(
            Icons.more_vert,
            color: preto,
            size: 24,
          ),
          onSelected: (ItemMenu2Enum item) {
            setState(() {
              selectedMenu = item;
              if (item == ItemMenu2Enum.exibir) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DetalhesProduto(id: idProduto);
                    },
                  ),
                );
              } else if (item == ItemMenu2Enum.editar) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditarProduto(id: idProduto),
                  ),
                );
              } else if (item == ItemMenu2Enum.remover) {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text("Aviso!"),
                    content: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Deseja remover o produto?"),
                      ],
                    ),
                    icon: const Icon(
                      Icons.warning_amber_rounded,
                      size: 64,
                    ),
                    iconColor: Colors.red,
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Não',
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: fontFamily,
                            fontWeight: fontWeightRegular,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Consumer(
                        builder: (BuildContext context, ProdutoData2 lista,
                            Widget? widget) {
                          return TextButton(
                            onPressed: () {
                              lista.removerProduto(idProduto);
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Sim',
                              style: TextStyle(
                                color: azul1,
                                fontFamily: fontFamily,
                                fontWeight: fontWeightRegular,
                                fontSize: 14,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
            });
          },
          itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<ItemMenu2Enum>>[
            const PopupMenuItem<ItemMenu2Enum>(
              value: ItemMenu2Enum.exibir,
              child: Text('Exibir', style: style16Regular),
            ),
            const PopupMenuItem<ItemMenu2Enum>(
              value: ItemMenu2Enum.editar,
              child: Text('Editar', style: style16Regular),
            ),
            const PopupMenuItem<ItemMenu2Enum>(
              value: ItemMenu2Enum.remover,
              child: Text('Remover', style: style16Regular),
            ),
          ],
        ),
      ),
    );
  }
}
