import 'package:flutter/material.dart';
import 'package:app_lista_compras/models/usuario_model.dart';
import 'package:app_lista_compras/components/item_detalhes.dart';
import 'package:app_lista_compras/components/appbar.dart';
import 'package:app_lista_compras/components/botao.dart';
import 'package:app_lista_compras/styles/colors.dart';
import 'package:app_lista_compras/utils/data_teste.dart';

class DetalhesUsuario extends StatefulWidget {
  const DetalhesUsuario({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<DetalhesUsuario> createState() => _DetalhesUsuarioState();
}

class _DetalhesUsuarioState extends State<DetalhesUsuario> {
  @override
  Widget build(BuildContext context) {
    UsuarioModel usuario = usuarioTeste3.firstWhere(
      (item) => item.id == widget.id,
      orElse: () => UsuarioModel(
        id: 0,
        nome: "",
        email: "",
        senha: "",
      ),
    );

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
              const SizedBox(height: 32),
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
                titulo: "Quantidade",
                descricao: usuario.email,
              ),
              ItemDetalhes(
                margin: const EdgeInsets.only(bottom: 16),
                titulo: "Categoria",
                descricao: usuario.senha,
              ),
              const SizedBox(height: 32),
              Botao(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const Homepage()));
                },
                label: "Editar",
                backgroundColor: azul1,
                fontColor: branco,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
