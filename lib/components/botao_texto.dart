import 'package:flutter/material.dart';
import 'package:app_lista_compras/styles/fonts.dart';

class BotaoTexto extends StatelessWidget {
  const BotaoTexto({
    super.key,
    required this.onPressed,
    required this.fontColor,
    required this.label,
    this.decoration,
    this.decorationColor,
    required this.fontWeight,
  });

  final void Function() onPressed;
  final Color fontColor;
  final String label;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: fontColor,
          fontSize: 16,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          decoration: decoration,
          decorationColor: decorationColor,
        ),
      ),
    );
  }
}
