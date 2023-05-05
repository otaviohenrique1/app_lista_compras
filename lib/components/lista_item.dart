import 'package:app_lista_compras/pages/editar_produto.dart';
import 'package:flutter/material.dart';
import 'package:app_lista_compras/pages/detalhes_produto.dart';
import 'package:app_lista_compras/styles/colors.dart';
import 'package:app_lista_compras/styles/fonts.dart';
import 'package:app_lista_compras/utils/helpers.dart';

enum ItemMenuEnum { exibir, editar, remover }

class ListaItem extends StatefulWidget {
  const ListaItem({
    super.key,
    required this.id,
    required this.nome,
    required this.quantidade,
    required this.unidade,
  });

  final int id;
  final String nome;
  final num quantidade;
  final String unidade;

  @override
  State<ListaItem> createState() => _ListaItemState();
}

class _ListaItemState extends State<ListaItem> {
  @override
  Widget build(BuildContext context) {
    ItemMenuEnum? selectedMenu;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 16, right: 0),
        // contentPadding: const EdgeInsets.symmetric(horizontal: 24),
        title: Text(widget.nome, style: style18Regular),
        subtitle: Text(
          formataQuantidadeUnidade(
            quantidade: widget.quantidade,
            unidade: widget.unidade,
          ),
          style: style16Regular,
        ),
        tileColor: cinza2,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: cinza1),
          borderRadius: BorderRadius.circular(2),
        ),
        trailing: PopupMenuButton<ItemMenuEnum>(
          initialValue: selectedMenu,
          icon: const Icon(
            Icons.more_vert,
            color: preto,
            size: 24,
          ),
          onSelected: (ItemMenuEnum item) {
            setState(() {
              selectedMenu = item;
              if (item == ItemMenuEnum.exibir) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalhesProduto(id: widget.id),
                  ),
                );
              } else if (item == ItemMenuEnum.editar) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditarProduto(id: widget.id),
                  ),
                );
              } else if (item == ItemMenuEnum.remover) {}
            });
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<ItemMenuEnum>>[
            const PopupMenuItem<ItemMenuEnum>(
              value: ItemMenuEnum.exibir,
              child: Text('Exibir', style: style16Regular),
            ),
            const PopupMenuItem<ItemMenuEnum>(
              value: ItemMenuEnum.editar,
              child: Text('Editar', style: style16Regular),
            ),
            const PopupMenuItem<ItemMenuEnum>(
              value: ItemMenuEnum.remover,
              child: Text('Remover', style: style16Regular),
            ),
          ],
        ),
      ),
    );
  }
}
