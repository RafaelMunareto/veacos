import 'package:flutter/material.dart';

class ForgetPage extends StatefulWidget {
  final String title;
  const ForgetPage({Key? key, this.title = 'ForgetPage'}) : super(key: key);
  @override
  ForgetPageState createState() => ForgetPageState();
}
class ForgetPageState extends State<ForgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}