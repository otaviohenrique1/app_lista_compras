import 'package:app_lista_compras/components/botao.dart';
import 'package:app_lista_compras/components/campo_texto.dart';
import 'package:app_lista_compras/components/titulo.dart';
import 'package:app_lista_compras/pages/recuperacao_senha.dart';
import 'package:app_lista_compras/styles/colors.dart';
import 'package:app_lista_compras/styles/fonts.dart';
import 'package:app_lista_compras/utils/validator.dart';
import 'package:flutter/material.dart';

class CodigoRecuperacao extends StatefulWidget {
  const CodigoRecuperacao({super.key});

  @override
  State<CodigoRecuperacao> createState() => _CodigoRecuperacaoState();
}

class _CodigoRecuperacaoState extends State<CodigoRecuperacao> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController _codigoRecuperacaoController =
      TextEditingController();

  @override
  void dispose() {
    _codigoRecuperacaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarSimples(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Titulo(
                  titulo: "Código de recuperação",
                  color: cinza1,
                  alignment: Alignment.center,
                  fontSize: 24,
                  fontWeight: fontWeightBold,
                ),
                const SizedBox(height: 48),
                const Titulo(
                  titulo:
                      "Digite o codigo de precuperação que foi enviado para o seu email.",
                  color: cinza1,
                  alignment: Alignment.center,
                  fontSize: 18,
                  fontWeight: fontWeightBold,
                ),
                const SizedBox(height: 48),
                CampoTexto(
                  label: "Código de recuperação",
                  hintText: "Insira o código de recuperação",
                  controller: _codigoRecuperacaoController,
                  exibeLabel: true,
                  keyboardType: TextInputType.number,
                  validator: validaCampoVazio,
                  obscureText: false,
                ),
                const SizedBox(height: 24),
                Botao(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RecuperacaoSenha(),
                        ),
                      );
                    }
                  },
                  label: "Confirmar",
                  backgroundColor: azul1,
                  fontColor: branco,
                ),
                const SizedBox(height: 8),
                Botao(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: "Voltar",
                  backgroundColor: cinza1,
                  fontColor: branco,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarSimples extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSimples({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: azul1,
      toolbarHeight: 0,
    );
  }
}
