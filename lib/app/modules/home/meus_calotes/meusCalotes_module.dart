// ignore_for_file: file_names

import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/modules/home/meus_calotes/meus_calotes_page.dart';
import 'package:veacos/app/modules/home/meus_calotes/meus_calotes_store.dart';

class MeusCalotesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MeusCalotesStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const MeusCalotesPage()),
  ];
}
