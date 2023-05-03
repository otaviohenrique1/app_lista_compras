import 'package:flutter/material.dart';
import 'package:app_lista_compras/components/appbar_simples.dart';
import 'package:app_lista_compras/components/titulo.dart';
import 'package:app_lista_compras/styles/colors.dart';
import 'package:app_lista_compras/styles/fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarSimples(),
      body: Center(
        child: SizedBox(
          width: 128,
          height: 128,
          child: Placeholder(
            child: Titulo(
              titulo: "Logo",
              color: preto,
              alignment: Alignment.center,
              fontSize: 24,
              fontWeight: fontWeightBold,
            ),
          ),
        ),
      ),
    );
  }
}
