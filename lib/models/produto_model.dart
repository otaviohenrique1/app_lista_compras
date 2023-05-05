class ProdutoModel {
  ProdutoModel({
    required this.id,
    required this.nome,
    required this.quantidade,
    required this.unidade,
    required this.categoria,
    required this.descricao,
    required this.ativo,
  });

  /* final */ String id;
  /* final */ String nome;
  /* final */ num quantidade;
  /* final */ String unidade;
  /* final */ String categoria;
  /* final */ String descricao;
  /* final */ bool ativo;
}
