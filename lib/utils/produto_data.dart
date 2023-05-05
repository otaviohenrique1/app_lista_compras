import 'package:app_lista_compras/models/produto_model.dart';
import 'package:app_lista_compras/utils/data_teste.dart';

class ProdutoData {
  ProdutoModel buscaProduto(int id) {
    ProdutoModel resultado = produtoTeste2.firstWhere(
      (item) => item.id == id,
      orElse: () => ProdutoModel(
        id: 0,
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
    produtoTeste2.add(produto);
  }

  void removerProduto(int id) {
    produtoTeste2.removeWhere((item) => item.id == id);
  }

  void editarProduto(int id, ProdutoModel novoProduto) {
    ProdutoModel produto = produtoTeste2.firstWhere((item) => item.id == id);
    produto.nome = novoProduto.nome;
    produto.quantidade = novoProduto.quantidade;
    produto.unidade = novoProduto.unidade;
    produto.categoria = novoProduto.categoria;
    produto.descricao = novoProduto.descricao;
    produto.ativo = novoProduto.ativo;
  }
}
