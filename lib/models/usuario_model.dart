class UsuarioModel {
  UsuarioModel({
    required this.id,
    required this.nome,
    required this.email,
    required this.senha,
    required this.dataCriacao,
  });

  /* final */ String id;
  /* final */ String nome;
  /* final */ String email;
  /* final */ String senha;
  /* final */ DateTime dataCriacao;
}
