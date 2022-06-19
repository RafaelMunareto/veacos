import 'package:flutter/material.dart';
import 'package:veacos/app/modules/settings/shared/components/imagem/imagem_settings_widget.dart';
import 'package:veacos/app/shared/components/app_bar_widget.dart';

class SettingsPage extends StatefulWidget {
  final String title;
  const SettingsPage({Key? key, this.title = 'SettingsPage'}) : super(key: key);
  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(drawer: false),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Expanded(
              child: ImagemSettingsWidget(),
            )
          ],
        ));
  }
}
