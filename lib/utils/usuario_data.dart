import 'package:app_lista_compras/models/usuario_model.dart';
import 'package:app_lista_compras/utils/data_teste.dart';

class UsuarioData {
  UsuarioModel buscaUsuario(int id) {
    UsuarioModel resultado = usuarioTeste3.firstWhere(
      (item) => item.id == id,
      orElse: () => UsuarioModel(
        id: 0,
        nome: "",
        email: "",
        senha: "",
      ),
    );

    return resultado;
  }

  void criarUsuario(UsuarioModel usuario) {
    usuarioTeste3.add(usuario);
  }

  void removerUsuario(int id) {
    usuarioTeste3.removeWhere((item) => item.id == id);
  }

  void editarUsuario(int id, UsuarioModel novoUsuario) {
    UsuarioModel usuario = usuarioTeste3.firstWhere((item) => item.id == id);
    usuario.nome = novoUsuario.nome;
    usuario.nome = novoUsuario.nome;
    usuario.email = novoUsuario.email;
    usuario.senha = novoUsuario.senha;
  }
}
