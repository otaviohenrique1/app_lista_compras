List<String> listaTeste = List.generate(100, (index) {
  int numero = index + 1;
  if ((numero) < 10) {
    return "00${index + 1}";
  } else if ((index + 1) >= 10 && (index + 1) < 100) {
    return "0${index + 1}";
  }
  return (index + 1).toString();
});

Map<String, dynamic> produtoTeste = {
  "nome": "Leite",
  "quantidade": 12,
  "unidade": "un",
  "categoria": "Bebida",
  "descricao":
      "Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident neque voluptates quo ipsam dignissimos sed aliquid delectus obcaecati dolorum nostrum itaque fuga, odit laboriosam ipsa quibusdam eius esse a numquam.",
  // "descricao": "Leite integral da marca Jussara",
  "ativo": false,
};

// Nome
// Quantidade
// Preço
// Categoria
// Quantidade
// Unidade
// Descrição
// Incluir na lista?