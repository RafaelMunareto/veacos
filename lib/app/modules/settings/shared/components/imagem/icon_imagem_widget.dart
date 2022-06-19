import 'package:flutter/material.dart';

class IconImagemWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  const IconImagemWidget(
      {Key? key, required this.icon, required this.color, this.size = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: color)),
      child: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }
}
