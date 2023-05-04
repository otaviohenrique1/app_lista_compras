
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

List<Map<String, dynamic>> usuarioTeste = [
  {
    "nome": "Usuario",
    "email": "usuario@email.com",
    "senha": "0123456789",
  },
  {
    "nome": "Usuario2",
    "email": "usuario2@email.com",
    "senha": "9876543210",
  },
];

Map<String, dynamic> usuarioTeste2 = {
  "nome": "Usuario",
  "email": "usuario@email.com",
  "senha": "0123456789",
};

List<Usuario> usuarioTeste3 = [
  Usuario(
    id: 1,
    nome: "Usuario",
    email: "usuario@email.com",
    senha: "0123456789",
  ),
  Usuario(
    id: 2,
    nome: "Usuario2",
    email: "usuario2@email.com",
    senha: "9876543210",
  ),
];

Usuario usuarioTeste4 = Usuario(
  id: 1,
  nome: "Usuario",
  email: "usuario@email.com",
  senha: "0123456789",
);

Map<String, dynamic> produtoTeste = {
  "nome": "Leite",
  "quantidade": 12,
  "unidade": "un",
  "categoria": "Bebida",
  "descricao":
      "Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident neque voluptates quo ipsam dignissimos sed aliquid delectus obcaecati dolorum nostrum itaque fuga, odit laboriosam ipsa quibusdam eius esse a numquam.",
  // "descricao": "Leite integral da marca Jussara",
  "ativo": true,
};

List<Produto> produtoTeste2 = [
  Produto(
    id: 1,
    nome: "Leite",
    quantidade: 30,
    unidade: "un",
    categoria: "Bebida",
    descricao:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident neque voluptates quo ipsam dignissimos sed aliquid delectus obcaecati dolorum nostrum itaque fuga, odit laboriosam ipsa quibusdam eius esse a numquam.",
    ativo: true,
  ),
  Produto(
    id: 2,
    nome: "Coca-cola",
    quantidade: 12,
    unidade: "un",
    categoria: "Bebida",
    descricao:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident neque voluptates quo ipsam dignissimos sed aliquid delectus obcaecati dolorum nostrum itaque fuga, odit laboriosam ipsa quibusdam eius esse a numquam.",
    ativo: true,
  ),
  Produto(
    id: 3,
    nome: "Mortadela",
    quantidade: 500,
    unidade: "g",
    categoria: "Comida",
    descricao:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident neque voluptates quo ipsam dignissimos sed aliquid delectus obcaecati dolorum nostrum itaque fuga, odit laboriosam ipsa quibusdam eius esse a numquam.",
    ativo: true,
  ),
  Produto(
    id: 4,
    nome: "Presunto",
    quantidade: 600,
    unidade: "g",
    categoria: "Comida",
    descricao:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident neque voluptates quo ipsam dignissimos sed aliquid delectus obcaecati dolorum nostrum itaque fuga, odit laboriosam ipsa quibusdam eius esse a numquam.",
    ativo: true,
  ),
  Produto(
    id: 5,
    nome: "Queijo",
    quantidade: 600,
    unidade: "g",
    categoria: "Comida",
    descricao:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident neque voluptates quo ipsam dignissimos sed aliquid delectus obcaecati dolorum nostrum itaque fuga, odit laboriosam ipsa quibusdam eius esse a numquam.",
    ativo: true,
  ),
  Produto(
    id: 6,
    nome: "Ovo de páscoa",
    quantidade: 10,
    unidade: "un",
    categoria: "Comida",
    descricao:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident neque voluptates quo ipsam dignissimos sed aliquid delectus obcaecati dolorum nostrum itaque fuga, odit laboriosam ipsa quibusdam eius esse a numquam.",
    ativo: true,
  ),
  Produto(
    id: 7,
    nome: "Tomate",
    quantidade: 1,
    unidade: "kg",
    categoria: "Comida",
    descricao:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident neque voluptates quo ipsam dignissimos sed aliquid delectus obcaecati dolorum nostrum itaque fuga, odit laboriosam ipsa quibusdam eius esse a numquam.",
    ativo: true,
  ),
  Produto(
    id: 8,
    nome: "Laranja",
    quantidade: 2,
    unidade: "kg",
    categoria: "Comida",
    descricao:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident neque voluptates quo ipsam dignissimos sed aliquid delectus obcaecati dolorum nostrum itaque fuga, odit laboriosam ipsa quibusdam eius esse a numquam.",
    ativo: true,
  ),
  Produto(
    id: 9,
    nome: "Maçã",
    quantidade: 3,
    unidade: "kg",
    categoria: "Bebida",
    descricao:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident neque voluptates quo ipsam dignissimos sed aliquid delectus obcaecati dolorum nostrum itaque fuga, odit laboriosam ipsa quibusdam eius esse a numquam.",
    ativo: true,
  ),
];

List<Map<String, dynamic>> produtoTeste3 = [
  {
    "nome": "Leite",
    "quantidade": 30,
    "unidade": "un",
    "categoria": "Bebida",
  },
  {
    "nome": "Coca-cola",
    "quantidade": 12,
    "unidade": "un",
    "categoria": "Bebida",
  },
  {
    "nome": "Mortadela",
    "quantidade": 500,
    "unidade": "g",
    "categoria": "Comida",
  },
  {
    "nome": "Presunto",
    "quantidade": 600,
    "unidade": "g",
    "categoria": "Comida",
  },
  {
    "nome": "Queijo",
    "quantidade": 600,
    "unidade": "g",
    "categoria": "Comida",
  },
  {
    "nome": "Ovo de páscoa",
    "quantidade": 10,
    "unidade": "un",
    "categoria": "Comida",
  },
  {
    "nome": "Tomate",
    "quantidade": 1,
    "unidade": "kg",
    "categoria": "Comida",
  },
  {
    "nome": "Laranja",
    "quantidade": 2,
    "unidade": "kg",
    "categoria": "Comida",
  },
  {
    "nome": "Maçã",
    "quantidade": 3,
    "unidade": "kg",
    "categoria": "Bebida",
  },
];

Produto produtoTeste4 = Produto(
  id: 1,
  nome: "Leite",
  quantidade: 30,
  unidade: "un",
  categoria: "Bebida",
  descricao:
      "Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident neque voluptates quo ipsam dignissimos sed aliquid delectus obcaecati dolorum nostrum itaque fuga, odit laboriosam ipsa quibusdam eius esse a numquam.",
  ativo: true,
);
