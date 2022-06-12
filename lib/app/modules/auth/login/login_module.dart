import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/modules/auth/login/login_page.dart';
import 'package:veacos/app/modules/auth/login/login_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginPage()),
  ];
}
