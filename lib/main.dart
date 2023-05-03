import 'package:app_lista_compras/components/botao.dart';
import 'package:app_lista_compras/components/botao_texto.dart';
import 'package:app_lista_compras/components/titulo.dart';
import 'package:app_lista_compras/styles/colors.dart';
import 'package:app_lista_compras/styles/fonts.dart';
import 'package:app_lista_compras/utils/validator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Login(title: 'Flutter Demo Home Page'),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key, required this.title});

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: azul1,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Titulo(
                  titulo: "Faça login em sua conta",
                  color: cinza1,
                  alignment: Alignment.center,
                  fontSize: 24,
                  fontWeight: fontWeightBold,
                ),
                const SizedBox(height: 32),
                CampoTexto(
                  label: "Email",
                  hintText: "Insira seu endereço de email",
                  controller: _emailController,
                  exibeLabel: true,
                  keyboardType: TextInputType.emailAddress,
                  validator: validaEmail,
                  obscureText: false,
                ),
                const SizedBox(height: 24),
                CampoTexto(
                  label: "Senha",
                  hintText: "Insira sua senha",
                  controller: _senhaController,
                  exibeLabel: true,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: validaSenha,
                ),
                const SizedBox(height: 24),
                Botao(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const Homepage(),
                      //   ),
                      // );
                    }
                  },
                  label: "Entrar",
                  backgroundColor: azul1,
                  fontColor: branco,
                ),
                BotaoTexto(
                  onPressed: () {},
                  label: "Esqueceu sua senha?",
                  fontColor: azul1,
                  decoration: TextDecoration.underline,
                  decorationColor: azul1,
                  fontWeight: fontWeightRegular,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Ainda não tem conta?",
                      style: TextStyle(
                        color: cinza1,
                        fontSize: 16,
                        fontFamily: fontFamily,
                        fontWeight: fontWeightRegular,
                      ),
                    ),
                    BotaoTexto(
                      label: "Faça seu cadastro!",
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const Cadastro(),
                        //   ),
                        // );
                      },
                      fontColor: azul1,
                      fontWeight: fontWeightBold,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CampoTexto extends StatelessWidget {
  const CampoTexto({
    super.key,
    required this.exibeLabel,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.label,
    this.validator,
    this.keyboardType,
    this.initialValue,
  });

  final bool exibeLabel;
  final String? label;
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: exibeLabel,
          child: Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                (label == null) ? "" : label!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: fontWeightBold,
                ),
              ),
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 16),
            errorStyle: const TextStyle(fontSize: 16),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: preto,
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: azul1,
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
