bool validaValor(String? value) {
  return (value == null || value.isEmpty);
}

String? validaEmail(String? value) {
  if (validaValor(value)) {
    return "Campo vazio";
  } else if (!value!.contains("@")) {
    return "Email deve conter @";
  }
  return null;
}
