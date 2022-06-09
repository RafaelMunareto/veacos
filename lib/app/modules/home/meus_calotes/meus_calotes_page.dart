import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/modules/home/home_store.dart';
import 'package:veacos/app/shared/components/app_bar_widget.dart';
import 'package:veacos/app/shared/components/bottom_navigate_widget.dart';
import 'package:veacos/app/shared/components/drawer_widget.dart';

class MeusCalotesPage extends StatefulWidget {
  final String title;
  const MeusCalotesPage({Key? key, this.title = 'MeusCalotesPage'})
      : super(key: key);
  @override
  MeusCalotesPageState createState() => MeusCalotesPageState();
}

class MeusCalotesPageState extends State<MeusCalotesPage> {
  HomeStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
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
