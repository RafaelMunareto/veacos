import 'package:veacos/app/modules/home/shared/controller/client_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/shared/auth/repositories/guard.dart';
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
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const HomePage(), guards: [AuthGuard()]),
  ];
}
