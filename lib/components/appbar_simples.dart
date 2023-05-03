import 'package:flutter/material.dart';
import 'package:app_lista_compras/styles/colors.dart';

class AppBarSimples extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSimples({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: azul1,
      toolbarHeight: 0,
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(10);
  }
}
