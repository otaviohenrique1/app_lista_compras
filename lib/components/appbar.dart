import 'package:app_lista_compras/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:app_lista_compras/styles/fonts.dart';
import 'package:app_lista_compras/styles/colors.dart';

enum ItemMenuEnum { pefil, busca, sair }

class AppBarHeader extends StatefulWidget implements PreferredSizeWidget {
  const AppBarHeader({
    super.key,
    required this.titulo,
  });

  final String titulo;

  @override
  State<AppBarHeader> createState() => _AppBarHeaderState();

  @override
  Size get preferredSize {
    return const Size.fromHeight(67);
  }
}

class _AppBarHeaderState extends State<AppBarHeader> {
  @override
  Widget build(BuildContext context) {
    ItemMenuEnum? selectedMenu;

    return AppBar(
      backgroundColor: azul1,
      title: Text(
        widget.titulo,
        style: const TextStyle(
          color: branco,
          fontFamily: fontFamily,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.white,
            size: 36,
          ),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const Busca()),
            // );
          },
        ),
        PopupMenuButton<ItemMenuEnum>(
          initialValue: selectedMenu,
          icon: const Icon(
            Icons.account_circle,
            color: Colors.white,
            size: 36,
          ),
          onSelected: (item) {
            setState(() {
              selectedMenu = item;
              if (item == ItemMenuEnum.busca) {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const Busca()),
                // );
              } else if (item == ItemMenuEnum.pefil) {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const Perfil()),
                // );
              } else if (item == ItemMenuEnum.sair) {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Aviso!'),
                    content: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Deseja sair do aplicativo?'),
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
                        // onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Não'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // Navigator.pop(context, 'OK');
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          );
                        },
                        child: const Text('Sim'),
                      ),
                    ],
                  ),
                );
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => const Login()),
                // );
              }
            });
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<ItemMenuEnum>>[
            const PopupMenuItem<ItemMenuEnum>(
              value: ItemMenuEnum.pefil,
              child: Text(
                'Pefil',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const PopupMenuItem<ItemMenuEnum>(
              value: ItemMenuEnum.busca,
              child: Text(
                'Busca',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const PopupMenuItem<ItemMenuEnum>(
              value: ItemMenuEnum.sair,
              child: Text(
                'Sair',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
