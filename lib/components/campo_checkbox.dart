import 'package:app_lista_compras/styles/colors.dart';
import 'package:app_lista_compras/styles/fonts.dart';
import 'package:flutter/material.dart';

class CheckboxModel {
  CheckboxModel({required this.texto, this.checked = false});

  String texto;
  bool checked;
}

class CampoCheckbox extends StatefulWidget {
  const CampoCheckbox({super.key, required this.item});

  final CheckboxModel item;

  @override
  State<CampoCheckbox> createState() => _CampoCheckboxState();
}

class _CampoCheckboxState extends State<CampoCheckbox> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.item.texto,
        style: const TextStyle(
          fontFamily: fontFamily,
          fontWeight: fontWeightRegular,
          fontSize: 16,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 2,
      ),
      value: widget.item.checked,
      activeColor: azul1,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (value) {
        setState(() {
          widget.item.checked = value!;
        });
      },
    );
  }
}

/*
  CheckboxListTile(
    activeColor: azul1,
    controlAffinity: ListTileControlAffinity.leading,
    title: const Text("Ativo"),
    value: _isSelected,
    onChanged: (bool? newValue) {
      setState(() {
        _isSelected = newValue!;
      });
    },
  ),
*/
