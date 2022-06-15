import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/modules/home/home_store.dart';
import 'package:veacos/app/shared/components/app_bar_widget.dart';
import 'package:veacos/app/shared/components/bottom_navigate_widget.dart';
import 'package:veacos/app/shared/components/drawer_widget.dart';
import 'package:veacos/app/shared/utils/themes/theme.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        drawer: true,
      ),
      drawer: const DrawerWidget(),
      bottomNavigationBar: const BottomNavigateWidget(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              children: [
                Flexible(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(40.0),
                          bottomLeft: Radius.circular(40.0)),
                      color: store.client.theme
                          ? darkThemeData(context).primaryColor
                          : lightThemeData(context).primaryColor,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius:
                                      MediaQuery.of(context).size.width * 0.11,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius:
                                        MediaQuery.of(context).size.width * 0.1,
                                    backgroundImage: const AssetImage(
                                        'assets/img/munareto.jpg'),
                                  ),
                                ),
                                const Text(
                                  'Recebedor',
                                  style: TextStyle(
                                      fontSize: 18,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(2.0, 2.0),
                                          blurRadius: 1.0,
                                        ),
                                        Shadow(
                                          offset: Offset(2.0, 2.0),
                                          blurRadius: 0.3,
                                        ),
                                      ],
                                      color: Colors.white),
                                ),
                                const Text(
                                  'Rafael Menezes Munareto',
                                  style: TextStyle(
                                      fontSize: 18,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(2.0, 2.0),
                                          blurRadius: 1.0,
                                        ),
                                        Shadow(
                                          offset: Offset(2.0, 2.0),
                                          blurRadius: 0.3,
                                        ),
                                      ],
                                      color: Colors.white),
                                ),
                                const Text(
                                  "10.000,00",
                                  style: TextStyle(
                                      fontSize: 18,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(2.0, 2.0),
                                          blurRadius: 1.0,
                                        ),
                                        Shadow(
                                          offset: Offset(2.0, 2.0),
                                          blurRadius: 0.3,
                                        ),
                                      ],
                                      color: Colors.white),
                                ),
                                const Icon(
                                  Icons.change_circle_sharp,
                                  size: 48,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 7,
                  child: Column(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          ListTile(
                            leading: const CircleAvatar(
                              minRadius: 10,
                              maxRadius: 15,
                              backgroundImage:
                                  AssetImage('assets/img/munareto.jpg'),
                              backgroundColor: Colors.transparent,
                            ),
                            title: const Text('Rafael Menezes Munareto'),
                            trailing: SizedBox(
                              width: 100,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 80,
                                    child: TextField(
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                      controller:
                                          TextEditingController(text: "100.00"),
                                    ),
                                  ),
                                  const Expanded(
                                      child: Icon(Icons.receipt_long))
                                ],
                              ),
                            ),
                          ),
                          ListTile(
                            leading: const CircleAvatar(
                              minRadius: 10,
                              maxRadius: 15,
                              backgroundImage:
                                  AssetImage('assets/img/munareto.jpg'),
                              backgroundColor: Colors.transparent,
                            ),
                            title: const Text('Rafael Menezes Munareto'),
                            trailing: SizedBox(
                              width: 100,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 80,
                                    child: TextField(
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                      controller:
                                          TextEditingController(text: "100.00"),
                                    ),
                                  ),
                                  const Expanded(
                                      child: Icon(
                                    Icons.receipt_long,
                                  ))
                                ],
                              ),
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
