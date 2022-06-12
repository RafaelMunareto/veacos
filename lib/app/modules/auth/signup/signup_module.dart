import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/modules/auth/signup/signup_page.dart';
import 'package:veacos/app/modules/auth/signup/signup_store.dart';

class SignupModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SignupStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const SignupPage()),
  ];
}
