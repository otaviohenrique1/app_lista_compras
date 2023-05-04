import 'package:flutter/material.dart';
import 'package:app_lista_compras/styles/fonts.dart';
import 'package:app_lista_compras/styles/colors.dart';

enum ItemMenuEnum { pefil, busca, sair }

class AppBarSimples extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSimples({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: azul1,
      title: const Text(
        "Lista",
        style: TextStyle(
          color: branco,
          fontFamily: fontFamily,
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(10);
  }
}
