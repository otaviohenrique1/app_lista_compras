import 'package:app_lista_compras/styles/fonts.dart';
import 'package:flutter/material.dart';

class Titulo extends StatelessWidget {
  const Titulo({
    super.key,
    required this.titulo,
    required this.color,
    required this.alignment,
    required this.fontSize,
    required this.fontWeight,
  });

  final String titulo;
  final Color color;
  final AlignmentGeometry alignment;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Text(
        titulo,
        softWrap: true,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          // fontSize: 24,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          // fontWeight: fontWeightBold,
        ),
      ),
    );
  }
}
