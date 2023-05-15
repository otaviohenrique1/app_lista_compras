import 'package:app_lista_compras/data/usuario_dao.dart';
import 'package:flutter/material.dart';
import 'package:app_lista_compras/models/usuario_model.dart';
import 'package:app_lista_compras/utils/data_teste.dart';

class UsuarioData {
  UsuarioModel buscaUsuario(String id) {
    UsuarioModel resultado = usuarioTeste.firstWhere(
      (item) => item.id == id,
      orElse: () => UsuarioModel(
        id: "",
        nome: "",
        email: "",
        senha: "",
        dataCriacao: DateTime.now(),
      ),
    );

    return resultado;
  }

  void criarUsuario(UsuarioModel usuario) {
    usuarioTeste.add(usuario);
  }

  void removerUsuario(String id) {
    usuarioTeste.removeWhere((item) => item.id == id);
  }

  void editarUsuario(String id, UsuarioModel novoUsuario) {
    UsuarioModel usuario = usuarioTeste.firstWhere((item) => item.id == id);
    usuario.nome = novoUsuario.nome;
    usuario.nome = novoUsuario.nome;
    usuario.email = novoUsuario.email;
    usuario.senha = novoUsuario.senha;
  }

  UsuarioModel? validaLogin({
    required String email,
    required String senha,
  }) {
    // usuarioTeste.firstWhere((item) {
    //   bool validaEmail = item.email == email;
    //   bool validaSenha = item.senha == senha;
    //   return validaEmail && validaSenha;
    // });

    // var teste = usuarioTeste.where((item) => item.email == email);
    // var validaEmail = usuarioTeste.firstWhere((item) => item.email == email);
    // var validaSenha = usuarioTeste.firstWhere((item) => item.senha == senha);

    for (var usuario in usuarioTeste) {
      bool validaEmail = usuario.email == email;
      bool validaSenha = usuario.senha == senha;
      if (validaEmail && validaSenha) {
        return usuario;
      }
    }
    return null;
  }
}

class UsuarioData2 extends ChangeNotifier {
  UsuarioData2({required this.usuarios});

  List<UsuarioModel> usuarios = [];

  UsuarioModel buscaUsuario(String id) {
    UsuarioModel resultado = usuarios.firstWhere(
      (item) => item.id == id,
      orElse: () => UsuarioModel(
        id: "",
        nome: "",
        email: "",
        senha: "",
        dataCriacao: DateTime.now(),
      ),
    );
    notifyListeners();
    return resultado;
  }

  void criarUsuario(UsuarioModel usuario) {
    usuarios.add(usuario);
    notifyListeners();
  }

  void removerUsuario(String id) {
    usuarioTeste.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void editarUsuario(String id, UsuarioModel novoUsuario) {
    UsuarioModel usuario = usuarios.firstWhere((item) => item.id == id);
    usuario.nome = novoUsuario.nome;
    usuario.nome = novoUsuario.nome;
    usuario.email = novoUsuario.email;
    usuario.senha = novoUsuario.senha;
    notifyListeners();
  }

  UsuarioModel? validaLogin({
    required String email,
    required String senha,
  }) {
    // usuarios.firstWhere((item) {
    //   bool validaEmail = item.email == email;
    //   bool validaSenha = item.senha == senha;
    //   return validaEmail && validaSenha;
    // });

    // var teste = usuarios.where((item) => item.email == email);
    // var validaEmail = usuarios.firstWhere((item) => item.email == email);
    // var validaSenha = usuarios.firstWhere((item) => item.senha == senha);

    for (var usuario in usuarios) {
      bool validaEmail = usuario.email == email;
      bool validaSenha = usuario.senha == senha;
      if (validaEmail && validaSenha) {
        notifyListeners();
        return usuario;
      }
    }
    notifyListeners();
    return null;
  }
}

class UsuarioData3 extends ChangeNotifier {
  UsuarioData3({required List<UsuarioModel> usuarios});

  // ignore: prefer_final_fields
  List<UsuarioModel> _usuarios = [];
  List<UsuarioModel> get usuarios1 => _usuarios;

  Future<List<UsuarioModel>> buscaUsuario(String id) {
    Future<List<UsuarioModel>> resultado =
        UsuarioDao().buscarUsuarioUsandoID(id);
    notifyListeners();
    return resultado;
  }

  void criarUsuario(UsuarioModel usuario) {
    UsuarioDao().criarUsuario(usuario);
    notifyListeners();
  }

  void removerUsuario(String id) {
    UsuarioDao().removerUsuario(id);
    notifyListeners();
  }

  void editarUsuario(String id, UsuarioModel novoUsuario) {
    UsuarioDao().atualizarUsuario(novoUsuario, id);
    notifyListeners();
  }

  Future<List<UsuarioModel>> validaLogin(
      {required String email, required String senha}) async {
    Future<List<UsuarioModel>> resultado =
        UsuarioDao().loginUsuario(email, senha);
    // resultado.then((value) {
    //   return value;
    // }).catchError((erro) {
    //   return erro;
    // });
    notifyListeners();
    return resultado;
  }
}
