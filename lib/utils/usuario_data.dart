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
