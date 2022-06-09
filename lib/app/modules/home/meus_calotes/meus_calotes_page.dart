import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';
import 'package:veacos/app/modules/home/home_store.dart';
import 'package:veacos/app/shared/components/app_bar_widget.dart';
import 'package:veacos/app/shared/components/bottom_navigate_widget.dart';
import 'package:veacos/app/shared/components/drawer_widget.dart';
import 'package:veacos/app/shared/utils/themes/theme.dart';

class Divida {
  const Divida(this.divida, this.valor);

  final String divida;
  final double valor;
}

class MeusCalotesPage extends StatefulWidget {
  final String title;
  const MeusCalotesPage({Key? key, this.title = 'MeusCalotesPage'})
      : super(key: key);
  @override
  MeusCalotesPageState createState() => MeusCalotesPageState();
}

class MeusCalotesPageState extends State<MeusCalotesPage> {
  HomeStore store = Modular.get();
  late List<Divida> _source;
  late List<TreemapColorMapper> _colorMappers;
  @override
  void initState() {
    _source = const [
      Divida('Bolo', 25.4),
      Divida('Pastel', 19.11),
      Divida('Gaúcho', 13.3),
      Divida('Meatz', 10.65),
    ];
    _colorMappers = const [
      TreemapColorMapper.range(from: 0, to: 10, color: Colors.blue),
      TreemapColorMapper.range(from: 11, to: 20, color: Colors.amber),
      TreemapColorMapper.range(from: 21, to: 30, color: Colors.teal),
      TreemapColorMapper.range(from: 31, to: 40, color: Colors.red),
      TreemapColorMapper.range(from: 41, to: 1000000, color: Colors.brown),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(drawer: true),
      bottomNavigationBar: const BottomNavigateWidget(),
      drawer: const DrawerWidget(),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SfTreemap(
                colorMappers: _colorMappers,
                dataCount: _source.length,
                weightValueMapper: (int index) {
                  return _source[index].valor;
                },
                levels: [
                  TreemapLevel(
                    groupMapper: (int index) {
                      return _source[index].divida;
                    },
                    labelBuilder: (BuildContext context, TreemapTile tile) {
                      return Padding(
                        padding: const EdgeInsets.all(2.5),
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText(
                                    // ignore: unnecessary_string_interpolations
                                    '${tile.group}',
                                    maxLines: 1,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 28),
                                  ),
                                  const AutoSizeText(
                                    'Há 3 dias',
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  '${tile.weight}',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 32),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
