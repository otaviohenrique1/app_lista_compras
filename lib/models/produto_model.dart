class Produto {
  Produto({
    required this.nome,
    required this.quantidade,
    required this.unidade,
    required this.categoria,
    required this.descricao,
    required this.ativo,
  });

  final String nome;
  final num quantidade;
  final String unidade;
  final String categoria;
  final String descricao;
  final bool ativo;
}
