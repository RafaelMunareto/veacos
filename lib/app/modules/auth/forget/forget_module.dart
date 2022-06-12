import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/modules/auth/forget/forget_page.dart';
import 'package:veacos/app/modules/auth/forget/forget_store.dart';

class ForgetModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ForgetStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const ForgetPage()),
  ];
}
