import 'package:app_lista_compras/provider/usuario_provider.dart';
import 'package:app_lista_compras/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:app_lista_compras/pages/editar_usuario.dart';
import 'package:app_lista_compras/components/item_detalhes.dart';
import 'package:app_lista_compras/components/appbar.dart';
import 'package:app_lista_compras/components/botao.dart';
import 'package:app_lista_compras/styles/colors.dart';
import 'package:app_lista_compras/models/usuario_model.dart';
import 'package:provider/provider.dart';

class DetalhesUsuario extends StatefulWidget {
  const DetalhesUsuario({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<DetalhesUsuario> createState() => _DetalhesUsuarioState();
}

class _DetalhesUsuarioState extends State<DetalhesUsuario> {
  @override
  Widget build(BuildContext context) {
    UsuarioProvider usuarioProvider =
        Provider.of<UsuarioProvider>(context, listen: false);
    UsuarioModel usuario = usuarioProvider.findById(widget.id);

    return Scaffold(
      appBar: const AppBarHeader(
        titulo: "Detalhes",
        exibeBusca: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              ItemDetalhes(
                margin: const EdgeInsets.only(bottom: 16),
                titulo: "ID",
                descricao: widget.id.toString(),
              ),
              ItemDetalhes(
                margin: const EdgeInsets.only(bottom: 16),
                titulo: "Nome",
                descricao: usuario.nome,
              ),
              ItemDetalhes(
                margin: const EdgeInsets.only(bottom: 16),
                titulo: "E-mail",
                descricao: usuario.email,
              ),
              ItemDetalhes(
                margin: const EdgeInsets.only(bottom: 16),
                titulo: "Senha",
                descricao: escondeSenha(usuario.senha),
              ),
              const SizedBox(height: 32),
              Botao(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditarUsuario(id: widget.id)));
                },
                label: "Editar",
                backgroundColor: azul1,
                fontColor: branco,
              ),
              Consumer(
                builder: (BuildContext context,
                    UsuarioProvider usuarioProviderConsumer, Widget? child) {
                  return Botao(
                    onPressed: () {
                      usuarioProviderConsumer.delete(widget.id);
                      Navigator.pop(context);
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
    );
  }
}
