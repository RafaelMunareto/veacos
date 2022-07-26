import 'package:flutter/material.dart';
import 'package:veacos/app/shared/utils/themes/theme.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final dynamic function;
  final bool loading;
  final double? width;
  final bool theme;
  final Function? setEtiqueta;
  final TextEditingController? controller;

  const ButtonWidget({
    Key? key,
    this.label = '',
    this.function,
    this.loading = false,
    required this.theme,
    this.width,
    this.controller,
    this.setEtiqueta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: theme
                  ? function == null
                      ? Colors.grey
                      : darkThemeData(context).primaryColor
                  : function == null
                      ? Colors.grey
                      : lightThemeData(context).primaryColor,
              enabledMouseCursor: SystemMouseCursors.click,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onPressed: () {
              if (setEtiqueta != null) {
                setEtiqueta!(controller!.text);
              }
              if (function != null) {
                function();
              }

              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            // gradient: const LinearGradient(colors: [
            //   Color.fromARGB(255, 255, 136, 34),
            //   Color.fromARGB(255, 255, 177, 41)
            // ]),
          ),
        ),
      ),
    );
  }
}
