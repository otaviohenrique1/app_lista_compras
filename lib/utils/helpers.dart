import 'package:uuid/uuid.dart';

String formataQuantidadeUnidade(
    {required num quantidade, required String unidade}) {
  return "$quantidade $unidade";
}

String escondeSenha(String senha) {
  return senha.replaceAll(RegExp(r"."), "#");
}

String geraUuid() {
  Uuid uuid = const Uuid();
  String resultado = uuid.v4();
  return resultado;
}
