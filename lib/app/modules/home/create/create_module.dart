import 'package:veacos/app/modules/home/create/create_page.dart';
import 'package:veacos/app/modules/home/create/create_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CreateStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const CreatePage()),
  ];
}
