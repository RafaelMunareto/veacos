import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/modules/home/home_store.dart';
import 'package:veacos/app/shared/components/app_bar_widget.dart';
import 'package:veacos/app/shared/components/bottom_navigate_widget.dart';
import 'package:veacos/app/shared/components/drawer_widget.dart';
import 'package:veacos/app/shared/utils/themes/theme.dart';

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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Column(
          children: [
            Flexible(
              flex: 5,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 16,
                    color: store.client.theme
                        ? darkThemeData(context).scaffoldBackgroundColor
                        : lightThemeData(context).scaffoldBackgroundColor,
                    child: Wrap(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Nova Divida:',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('Nome')),
                            controller: TextEditingController(text: "Bolo"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('Valor')),
                            controller: TextEditingController(text: "100"),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: ElevatedButton(
                                  onPressed: () {}, child: const Text('Gerar')),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: store.client.theme
                                      ? Colors.black45
                                      : lightThemeData(context)
                                          .shadowColor
                                          .withOpacity(0.2),
                                ),
                                BoxShadow(
                                  color: store.client.theme
                                      ? darkThemeData(context)
                                          .scaffoldBackgroundColor
                                      : lightThemeData(context)
                                          .scaffoldBackgroundColor,
                                  spreadRadius: -3.0,
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                            child: Wrap(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          child: TextField(
                                            decoration: const InputDecoration(
                                                border: InputBorder.none),
                                            controller: TextEditingController(
                                                text: "100.00"),
                                          ),
                                        ),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          child: TextField(
                                            decoration: const InputDecoration(
                                                border: InputBorder.none),
                                            controller: TextEditingController(
                                                text: "100.00"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
