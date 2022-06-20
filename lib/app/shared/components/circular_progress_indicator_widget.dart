import 'package:flutter/material.dart';

class CircularProgressIndicatorWidget extends StatelessWidget {
  final String title;
  const CircularProgressIndicatorWidget(
      {Key? key, this.title = "CircularProgressIndicatorWidget"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
