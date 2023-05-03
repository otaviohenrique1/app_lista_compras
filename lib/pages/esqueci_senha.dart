import 'package:app_lista_compras/components/appbar_simples.dart';
import 'package:app_lista_compras/components/botao.dart';
import 'package:app_lista_compras/components/botao_texto.dart';
import 'package:app_lista_compras/components/campo_texto.dart';
import 'package:app_lista_compras/components/titulo.dart';
import 'package:app_lista_compras/pages/codigo_recuperacao.dart';
import 'package:app_lista_compras/pages/novo_usuario.dart';
import 'package:app_lista_compras/styles/colors.dart';
import 'package:app_lista_compras/styles/fonts.dart';
import 'package:app_lista_compras/utils/validator.dart';
import 'package:flutter/material.dart';

class EsqueciSenha extends StatefulWidget {
  const EsqueciSenha({super.key});

  @override
  State<EsqueciSenha> createState() => _EsqueciSenhaState();
}

class _EsqueciSenhaState extends State<EsqueciSenha> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarSimples(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Titulo(
                  titulo: "Esqueci a senha",
                  color: cinza1,
                  alignment: Alignment.center,
                  fontSize: 24,
                  fontWeight: fontWeightBold,
                ),
                const SizedBox(height: 48),
                const Titulo(
                  titulo:
                      "Um código sera enviado para o seu email para recuperar a senha.",
                  color: cinza1,
                  alignment: Alignment.center,
                  fontSize: 18,
                  fontWeight: fontWeightBold,
                ),
                const SizedBox(height: 48),
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
                Botao(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CodigoRecuperacao(),
                        ),
                      );
                    }
                  },
                  label: "Enviar",
                  backgroundColor: azul1,
                  fontColor: branco,
                ),
                const SizedBox(height: 8),
                Botao(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: "Voltar",
                  backgroundColor: cinza1,
                  fontColor: branco,
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
