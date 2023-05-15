import 'package:app_lista_compras/models/usuario_model.dart';
import 'package:app_lista_compras/pages/homepage.dart';
import 'package:app_lista_compras/utils/usuario_data.dart';
import 'package:flutter/material.dart';
import 'package:app_lista_compras/components/appbar_simples.dart';
import 'package:app_lista_compras/components/botao.dart';
import 'package:app_lista_compras/components/botao_texto.dart';
import 'package:app_lista_compras/components/campo_texto.dart';
import 'package:app_lista_compras/components/titulo.dart';
import 'package:app_lista_compras/pages/esqueci_senha.dart';
import 'package:app_lista_compras/pages/novo_usuario.dart';
import 'package:app_lista_compras/styles/colors.dart';
import 'package:app_lista_compras/styles/fonts.dart';
import 'package:app_lista_compras/utils/validator.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

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
    // ignore: unused_local_variable
    UsuarioData usuarioData = UsuarioData();

    return Scaffold(
      appBar: const AppBarSimples(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  width: 96,
                  height: 96,
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
                const SizedBox(height: 32),
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
                Consumer(builder:
                    (BuildContext context, UsuarioData2 lista, Widget? widget) {
                  return Botao(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        UsuarioModel? usuarioBuscado = lista.validaLogin(
                          email: _emailController.text,
                          senha: _senhaController.text,
                        );

                        if (usuarioBuscado != null) {
                          /* enviar o usuario */
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Homepage(),
                            ),
                          );
                        } else {
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(
                          //     content: Text("Criando uma nova tarefa"),
                          //   ),
                          // );
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text("Erro!"),
                              content: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("E-mail ou senha inválidos"),
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
                                  child: const Text(
                                    'Fechar',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: fontFamily,
                                      fontWeight: fontWeightRegular,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    },
                    label: "Entrar",
                    backgroundColor: azul1,
                    fontColor: branco,
                  );
                }),
                BotaoTexto(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EsqueciSenha()),
                    );
                  },
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NovoUsuario()),
                        );
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

// class AppBarSimples extends StatelessWidget implements PreferredSizeWidget {
//   const AppBarSimples({
//     super.key,
//   });

//   @override
//   Size get preferredSize => const Size.fromHeight(0);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: azul1,
//       toolbarHeight: 0,
//     );
//   }
// }
