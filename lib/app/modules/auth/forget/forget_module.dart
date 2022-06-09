import 'package:veacos/app/modules/auth/forget/forget_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ForgetModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ForgetStore()),
  ];

  @override
  final List<ModularRoute> routes = [];
}
