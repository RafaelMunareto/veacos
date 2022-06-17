import 'package:veacos/app/modules/auth/change/change_page.dart';
import 'package:veacos/app/modules/auth/change/change_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChangeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ChangeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => ChangePage(code: args.queryParams['code'])),
  ];
}
