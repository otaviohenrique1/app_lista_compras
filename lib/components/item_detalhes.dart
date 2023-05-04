import 'package:app_lista_compras/styles/fonts.dart';
import 'package:flutter/material.dart';
import 'package:app_lista_compras/styles/colors.dart';

class ItemDetalhes extends StatelessWidget {
  const ItemDetalhes({
    super.key,
    required this.titulo,
    required this.descricao,
    required this.margin,
  });

  final String titulo;
  final String descricao;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: cinza2,
        border: Border.all(),
        borderRadius: const BorderRadius.all(
          Radius.elliptical(8, 8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                titulo,
                style: style16Bold,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                descricao,
                textAlign: TextAlign.justify,
                style: style18Regular,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
