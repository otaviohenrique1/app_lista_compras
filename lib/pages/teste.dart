import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuState with ChangeNotifier {
  String _selectedOption = "Opção 1";

  String get selectedOption => _selectedOption;

  set selectedOption(String option) {
    _selectedOption = option;
    notifyListeners();
  }
}

class MyMenu extends StatelessWidget {
  const MyMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (String option) {
        Provider.of<MenuState>(context, listen: false).selectedOption = option;
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem(
          value: "Opção 1",
          child: Text("Opção 1"),
        ),
        const PopupMenuItem(
          value: "Opção 2",
          child: Text("Opção 2"),
        ),
      ],
    );
  }
}

class AppTeste extends StatelessWidget {
  const AppTeste({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MenuState(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Meu App"),
            actions: <Widget>[
              Consumer<MenuState>(
                builder: (context, menuState, child) {
                  return IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Opção selecionada"),
                            content: Text(menuState.selectedOption),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
