import 'package:veacos/app/modules/home/shared/controller/client_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/modules/home/meus_calotes/meusCalotes_module.dart';
import '../home/home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ClientStore()),
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ModuleRoute('/meus_calotes/',
        module: MeusCalotesModule(),
        transition: TransitionType.leftToRightWithFade),
  ];
}