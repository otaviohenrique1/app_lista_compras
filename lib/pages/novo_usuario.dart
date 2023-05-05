import 'package:app_lista_compras/models/usuario_model.dart';
import 'package:app_lista_compras/utils/helpers.dart';
import 'package:app_lista_compras/utils/usuario_data.dart';
import 'package:flutter/material.dart';
import 'package:app_lista_compras/components/appbar_simples.dart';
import 'package:app_lista_compras/components/botao.dart';
import 'package:app_lista_compras/components/campo_texto.dart';
import 'package:app_lista_compras/components/titulo.dart';
import 'package:app_lista_compras/styles/colors.dart';
import 'package:app_lista_compras/styles/fonts.dart';
import 'package:app_lista_compras/utils/validator.dart';

class NovoUsuario extends StatefulWidget {
  const NovoUsuario({super.key});

  @override
  State<NovoUsuario> createState() => _NovoUsuarioState();
}

class _NovoUsuarioState extends State<NovoUsuario> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _repitaSenhaController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _repitaSenhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                const Titulo(
                  titulo: "Crie uma conta",
                  color: cinza1,
                  alignment: Alignment.center,
                  fontSize: 24,
                  fontWeight: fontWeightBold,
                ),
                const SizedBox(height: 24),
                CampoTexto(
                  label: "Nome",
                  hintText: "Insira seu nome",
                  controller: _nomeController,
                  exibeLabel: true,
                  keyboardType: TextInputType.text,
                  validator: validaCampoVazio,
                  obscureText: false,
                ),
                const SizedBox(height: 24),
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
                CampoTexto(
                  label: "Repita a senha",
                  hintText: "Repita a sua senha",
                  controller: _repitaSenhaController,
                  exibeLabel: true,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: validaSenha,
                ),
                const SizedBox(height: 32),
                Botao(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        usuarioData.criarUsuario(UsuarioModel(
                          id: geraUuid(),
                          nome: _nomeController.text,
                          email: _emailController.text,
                          senha: _senhaController.text,
                        ));
                      });
                      Navigator.pop(context);
                    }
                  },
                  label: "Entrar",
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
