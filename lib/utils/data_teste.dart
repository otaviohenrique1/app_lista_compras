import 'package:app_lista_compras/models/produto_model.dart';
import 'package:app_lista_compras/models/usuario_model.dart';

List<String> listaTeste = List.generate(100, (index) {
  int numero = index + 1;
  if ((numero) < 10) {
    return "00${index + 1}";
  } else if ((index + 1) >= 10 && (index + 1) < 100) {
    return "0${index + 1}";
  }
  return (index + 1).toString();
});

List<UsuarioModel> usuarioTeste = [
  UsuarioModel(
    id: "187726dc-577a-4322-b691-68b0b2435e45",
    nome: "Usuario",
    email: "usuario@email.com",
    senha: "0123456789",
    dataCriacao: DateTime.now(),
  ),
  UsuarioModel(
    id: "f1a169c1-0106-4313-b270-85977311d3aa",
    nome: "Usuario2",
    email: "usuario2@email.com",
    senha: "9876543210",
    dataCriacao: DateTime.now(),
  ),
];

List<ProdutoModel> produtoTeste = [
  ProdutoModel(
    id: "1dcf391d-addf-4561-a577-6925573c6731",
    nome: "Leite",
    quantidade: 30,
    unidade: "un",
    categoria: "Bebida",
    descricao:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident neque voluptates quo ipsam dignissimos sed aliquid delectus obcaecati dolorum nostrum itaque fuga, odit laboriosam ipsa quibusdam eius esse a numquam.",
    ativo: true,
    idUsuario: "187726dc-577a-4322-b691-68b0b2435e45",
    dataCriacao: DateTime.now(),
  ),
  ProdutoModel(
    id: "2bcaf425-9d92-4ec3-9acf-bc0e6e410f12",
    nome: "Coca-cola",
    quantidade: 12,
    unidade: "un",
    categoria: "Bebida",
    descricao:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident neque voluptates quo ipsam dignissimos sed aliquid delectus obcaecati dolorum nostrum itaque fuga, odit laboriosam ipsa quibusdam eius esse a numquam.",
    ativo: true,
    idUsuario: "187726dc-577a-4322-b691-68b0b2435e45",
    dataCriacao: DateTime.now(),
  ),
  ProdutoModel(
    id: "f5f8919e-a037-42bf-9339-4222584202b7",
    nome: "Mortadela",
    quantidade: 500,
    unidade: "g",
    categoria: "Comida",
    descricao:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident neque voluptates quo ipsam dignissimos sed aliquid delectus obcaecati dolorum nostrum itaque fuga, odit laboriosam ipsa quibusdam eius esse a numquam.",
    ativo: true,
    idUsuario: "187726dc-577a-4322-b691-68b0b2435e45",
    dataCriacao: DateTime.now(),
  ),
  ProdutoModel(
    id: "d856568d-3c9c-4fee-82db-ab396a0bf7be",
    nome: "Presunto",
    quantidade: 600,
    unidade: "g",
    categoria: "Comida",
    descricao:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident neque voluptates quo ipsam dignissimos sed aliquid delectus obcaecati dolorum nostrum itaque fuga, odit laboriosam ipsa quibusdam eius esse a numquam.",
    ativo: true,
    idUsuario: "187726dc-577a-4322-b691-68b0b2435e45",
    dataCriacao: DateTime.now(),
  ),
  ProdutoModel(
    id: "2bd1cba0-2157-4947-a8ad-9a05730f2b50",
    nome: "Queijo",
    quantidade: 600,
    unidade: "g",
    categoria: "Comida",
    descricao:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident neque voluptates quo ipsam dignissimos sed aliquid delectus obcaecati dolorum nostrum itaque fuga, odit laboriosam ipsa quibusdam eius esse a numquam.",
    ativo: true,
    idUsuario: "187726dc-577a-4322-b691-68b0b2435e45",
    dataCriacao: DateTime.now(),
  ),
  ProdutoModel(
    id: "5d5004f3-c624-42b4-a4f7-4bcb8b2eeb37",
    nome: "Ovo de páscoa",
    quantidade: 10,
    unidade: "un",
    categoria: "Comida",
    descricao:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident neque voluptates quo ipsam dignissimos sed aliquid delectus obcaecati dolorum nostrum itaque fuga, odit laboriosam ipsa quibusdam eius esse a numquam.",
    ativo: true,
    idUsuario: "187726dc-577a-4322-b691-68b0b2435e45",
    dataCriacao: DateTime.now(),
  ),
  ProdutoModel(
    id: "deae0092-dfc1-41f3-aab5-858a89ee8c4b",
    nome: "Tomate",
    quantidade: 1,
    unidade: "kg",
    categoria: "Comida",
    descricao:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident neque voluptates quo ipsam dignissimos sed aliquid delectus obcaecati dolorum nostrum itaque fuga, odit laboriosam ipsa quibusdam eius esse a numquam.",
    ativo: true,
    idUsuario: "187726dc-577a-4322-b691-68b0b2435e45",
    dataCriacao: DateTime.now(),
  ),
  ProdutoModel(
    id: "b688debd-9f9c-4a46-b316-c1e126e0d62e",
    nome: "Laranja",
    quantidade: 2,
    unidade: "kg",
    categoria: "Comida",
    descricao:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident neque voluptates quo ipsam dignissimos sed aliquid delectus obcaecati dolorum nostrum itaque fuga, odit laboriosam ipsa quibusdam eius esse a numquam.",
    ativo: true,
    idUsuario: "187726dc-577a-4322-b691-68b0b2435e45",
    dataCriacao: DateTime.now(),
  ),
  ProdutoModel(
    id: "7b762b40-1ec1-429c-b985-ec6b76e3a8e4",
    nome: "Maçã",
    quantidade: 3,
    unidade: "kg",
    categoria: "Bebida",
    descricao:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident neque voluptates quo ipsam dignissimos sed aliquid delectus obcaecati dolorum nostrum itaque fuga, odit laboriosam ipsa quibusdam eius esse a numquam.",
    ativo: true,
    idUsuario: "187726dc-577a-4322-b691-68b0b2435e45",
    dataCriacao: DateTime.now(),
  ),
];
