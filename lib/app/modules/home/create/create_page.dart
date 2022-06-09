import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/modules/home/home_store.dart';
import 'package:veacos/app/shared/components/app_bar_widget.dart';
import 'package:veacos/app/shared/components/bottom_navigate_widget.dart';
import 'package:veacos/app/shared/components/drawer_widget.dart';

class CreatePage extends StatefulWidget {
  final String title;
  const CreatePage({Key? key, this.title = 'CreatePage'}) : super(key: key);
  @override
  CreatePageState createState() => CreatePageState();
}

class CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    HomeStore store = Modular.get();
    return Scaffold(
      appBar: const AppBarWidget(drawer: true),
      bottomNavigationBar: const BottomNavigateWidget(),
      drawer: const DrawerWidget(),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
