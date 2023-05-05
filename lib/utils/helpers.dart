String formataQuantidadeUnidade(
    {required num quantidade, required String unidade}) {
  return "$quantidade $unidade";
}

String escondeSenha(String senha) {
  return senha.replaceAll(RegExp(r"."), "#");
}
