import 'package:flutter/material.dart';

import 'package:veacos/app/shared/auth/model/user_dio_client.model.dart';
import 'package:veacos/app/shared/auth/repositories/auth_repository.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_share.dart';

class AppBarWidget extends StatefulWidget with PreferredSizeWidget {
  final double size;

  AppBarWidget({
    Key? key,
    this.size = 55,
  }) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(size);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  bool search = false;
  AuthRepository auth = AuthRepository();
  ILocalStorage storage = LocalStorageShare();
  UserDioClientModel user = UserDioClientModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return AppBar();
    });
  }
}
