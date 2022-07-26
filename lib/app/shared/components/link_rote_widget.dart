import 'package:flutter/material.dart';
import 'package:veacos/app/shared/components/cursor_pointer_widget.dart';

class LinkRoteWidget extends StatelessWidget {
  final String label;
  final String labelBold;
  final String rota;

  const LinkRoteWidget(
      {Key? key, this.label = '', this.labelBold = '', required this.rota})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 12.0),
          ),
          CursorPointerWidget(route: rota, label: labelBold)
        ],
      ),
    );
  }
}
