import 'package:app_lista_compras/provider/usuario_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_lista_compras/components/appbar.dart';
import 'package:app_lista_compras/components/botao.dart';
import 'package:app_lista_compras/components/campo_texto.dart';
import 'package:app_lista_compras/utils/usuario_data.dart';
import 'package:app_lista_compras/utils/validator.dart';
import 'package:app_lista_compras/styles/colors.dart';
import 'package:app_lista_compras/models/usuario_model.dart';
import 'package:provider/provider.dart';

class EditarUsuario extends StatefulWidget {
  const EditarUsuario({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<EditarUsuario> createState() => _EditarUsuarioState();
}

class _EditarUsuarioState extends State<EditarUsuario> {
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
    UsuarioProvider listTypes =
        Provider.of<UsuarioProvider>(context, listen: false);
    UsuarioModel usuario = listTypes.findById(widget.id);

    _nomeController.text = usuario.nome;
    _emailController.text = usuario.email;
    _senhaController.text = usuario.senha;
    _repitaSenhaController.text = usuario.senha;

    return Scaffold(
      appBar: const AppBarHeader(
        titulo: "Editar usuario",
        exibeBusca: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              children: [
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
                Consumer(
                  builder: (BuildContext context, UsuarioProvider lista,
                      Widget? child) {
                    return Botao(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          lista.update(
                            UsuarioModel(
                              id: widget.id,
                              nome: _nomeController.text,
                              email: _emailController.text,
                              senha: _senhaController.text,
                              dataCriacao: usuario.dataCriacao,
                            ),
                            widget.id,
                          );
                          Navigator.pop(context);
                        }
                      },
                      label: "Salvar",
                      backgroundColor: azul1,
                      fontColor: branco,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
