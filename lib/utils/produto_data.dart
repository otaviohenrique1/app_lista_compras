import 'package:app_lista_compras/models/produto_model.dart';
import 'package:app_lista_compras/utils/data_teste.dart';

class ProdutoData {
  ProdutoModel buscaProduto(String id) {
    ProdutoModel resultado = produtoTeste.firstWhere(
      (item) => item.id == id,
      orElse: () => ProdutoModel(
        id: "",
        nome: "",
        quantidade: 0,
        unidade: "",
        categoria: "",
        descricao: "",
        ativo: true,
      ),
    );

    return resultado;
  }

  void criarProduto(ProdutoModel produto) {
    produtoTeste.add(produto);
  }

  void removerProduto(String id) {
    produtoTeste.removeWhere((item) => item.id == id);
  }

  void editarProduto(String id, ProdutoModel novoProduto) {
    ProdutoModel produto = produtoTeste.firstWhere((item) => item.id == id);
    produto.nome = novoProduto.nome;
    produto.quantidade = novoProduto.quantidade;
    produto.unidade = novoProduto.unidade;
    produto.categoria = novoProduto.categoria;
    produto.descricao = novoProduto.descricao;
    produto.ativo = novoProduto.ativo;
  }
}
