import 'package:flutter/material.dart';

class MeuInputText extends StatefulWidget {
  final TextEditingController ctrl;
  final int qtdCaracter;
  final TextInputType tipoTeclado;
  final String textlabel;
  final String texthint;
  final Icon icone;
  const MeuInputText({
    Key? key,
    required this.ctrl,
    required this.qtdCaracter,
    required this.tipoTeclado,
    required this.textlabel,
    required this.texthint,
    required this.icone,
  }) : super(key: key);

  @override
  State<MeuInputText> createState() => _MeuInputTextState();
}

class _MeuInputTextState extends State<MeuInputText> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.ctrl,
      maxLength: widget.qtdCaracter,
      keyboardType: widget.tipoTeclado,
      decoration: InputDecoration(
        labelText: widget.textlabel,
        hintText: widget.texthint,
        icon: widget.icone,
      ),
    );
  }
}
