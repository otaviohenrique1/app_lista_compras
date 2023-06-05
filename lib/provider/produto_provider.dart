import 'package:app_lista_compras/data/produto_dao.dart';
import 'package:app_lista_compras/models/produto_model.dart';
import 'package:flutter/material.dart';

class ProdutoProvider extends ChangeNotifier {
  List<ProdutoModel> _listaProdutos = [];
  List<ProdutoModel> _listaProdutosBusca = [];
  ProdutoModel _dadosTarefa = ProdutoModel(
    id: "",
    nome: "",
    quantidade: 0,
    unidade: "",
    categoria: "",
    descricao: "",
    ativo: false,
    idUsuario: "",
    dataCriacao: DateTime.now(),
  );

  List<ProdutoModel> dadosTarefa2 = [];

  List<ProdutoModel> get listaProdutos => _listaProdutos;
  List<ProdutoModel> get listaProdutosBusca => _listaProdutosBusca;
  ProdutoModel get dadosTarefa => _dadosTarefa;

  Future save(ProdutoModel tarefa) async {
    await ProdutoDao().save(tarefa);
    findAll();
    // notifyListeners();
  }

  final ProdutoModel _produtoModel = ProdutoModel(
    id: "",
    nome: "",
    quantidade: 0,
    unidade: "",
    categoria: "",
    descricao: "",
    ativo: false,
    idUsuario: "",
    dataCriacao: DateTime.now(),
  );

  Future delete(String idTarefa) async {
    await ProdutoDao().delete(idTarefa);
    _dadosTarefa = _produtoModel;
    findAll();
    // notifyListeners();
  }

  Future update(ProdutoModel tarefa, String idTarefa) async {
    await ProdutoDao().update(tarefa, idTarefa);
    findAll();
    // notifyListeners();
  }

  findById(String idTarefa) async {
    List<ProdutoModel> data = await ProdutoDao().findByID(idTarefa);
    if (data.isNotEmpty) {
      _dadosTarefa = data.first;
      notifyListeners();
    } else {
      _dadosTarefa = _produtoModel;
      notifyListeners();
    }
  }

  findByName(String nome) async {
    _listaProdutosBusca = await ProdutoDao().findByNome(nome);
    notifyListeners();
  }

  findAll() async {
    _listaProdutos = await ProdutoDao().findAll();
    notifyListeners();
  }
}
