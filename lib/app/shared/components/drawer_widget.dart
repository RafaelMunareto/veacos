import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/app_widget.dart';
import 'package:veacos/app/modules/home/home_store.dart';
import 'package:veacos/app/shared/utils/themes/theme.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  HomeStore store = Modular.get();
  String name = '';
  String? photo;

  @override
  void initState() {
    setState(() {
      name = 'Rafael Menezes Munareto';
      photo = 'assets/img/munareto.jpg';
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0)),
              color: store.client.theme
                  ? darkThemeData(context).primaryColor
                  : lightThemeData(context).primaryColor,
            ),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.08,
                  backgroundColor: Colors.white,
                  child: photo == null
                      ? const CircularProgressIndicator()
                      : CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.075,
                          backgroundImage: AssetImage(photo!),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.sunny, color: Colors.amber),
            title: Switch(
                value: store.client.theme,
                onChanged: (state) {
                  setState(() {
                    AppWidget.of(context)!
                        .changeTheme(state ? ThemeMode.dark : ThemeMode.light);
                    store.changeSwitch(state);
                    setState(() {
                      store.client.theme = state;
                    });
                  });
                }),
            trailing: const Icon(
              Icons.nightlight_round,
              color: Colors.blueGrey,
            ),
          ),
          ListTile(
            onTap: () => store.auth.logout(),
            leading: const Icon(Icons.logout),
            trailing: const Text('Sair'),
          ),
        ],
      ),
    );
  }
}
