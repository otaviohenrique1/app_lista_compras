import 'package:flutter/material.dart';
import 'package:app_lista_compras/components/appbar.dart';
import 'package:app_lista_compras/pages/novo_produto.dart';
import 'package:app_lista_compras/styles/colors.dart';
import 'package:app_lista_compras/styles/fonts.dart';

var listaTeste = List.generate(100, (index) {
  var data = (DateTime.now().year + index).toString();
  var resultado = data.substring(data.length - 2);
  return resultado;
});

List<String> listaTeste2 = [
  "1",
  "2",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
];

List<String> listaTeste3 = List.generate(100, (index) {
  int numero = index + 1;
  if ((numero) < 10) {
    return "00${index + 1}";
  } else if ((index + 1) >= 10 && (index + 1) < 100) {
    return "0${index + 1}";
  }
  return (index + 1).toString();
});

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
          itemCount: listaTeste3.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                contentPadding: const EdgeInsets.only(left: 16, right: 0),
                // contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                title: Text(
                  listaTeste3[index],
                  style: const TextStyle(
                    fontFamily: fontFamily,
                    fontWeight: fontWeightBold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  listaTeste3[index],
                  style: const TextStyle(
                    fontFamily: fontFamily,
                    fontWeight: fontWeightRegular,
                    fontSize: 16,
                  ),
                ),
                tileColor: cinza2,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2, color: cinza1),
                  borderRadius: BorderRadius.circular(2),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.more_vert,
                    color: preto,
                  ),
                  onPressed: () {},
                ),
              ),
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
