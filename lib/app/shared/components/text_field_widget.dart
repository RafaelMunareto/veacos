// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String labelText;
  final dynamic onChanged;
  final bool obscure;
  final dynamic errorText;
  final dynamic function;
  final bool functionBool;
  final bool outline;
  final dynamic initialValue;

  const TextFieldWidget({
    Key? key,
    required this.labelText,
    required this.onChanged,
    this.obscure = false,
    required this.errorText,
    this.outline = false,
    this.initialValue = '',
    this.function,
    this.functionBool = false,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController initial = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: TextField(
          key: Key(widget.labelText),
          onChanged: widget.onChanged,
          onEditingComplete: () {
            if (widget.functionBool) {
              widget.function();
            }
          },
          controller: initial,
          obscureText: widget.obscure,
          decoration: InputDecoration(
            errorStyle: const TextStyle(color: Colors.redAccent),
            border: !widget.outline ? null : const OutlineInputBorder(),
            labelText: widget.labelText,
            errorText: widget.errorText == null ? null : widget.errorText(),
          ),
        ),
      ),
    );
  }
}
