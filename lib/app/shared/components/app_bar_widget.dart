import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/shared/utils/themes/theme.dart';

class AppBarWidget extends StatefulWidget with PreferredSizeWidget {
  final bool drawer;
  final bool theme;
  const AppBarWidget({Key? key, this.drawer = false, this.theme = false})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(
            widget.drawer ? Icons.menu_rounded : Icons.arrow_back,
            color: widget.theme
                ? darkThemeData(context).scaffoldBackgroundColor
                : lightThemeData(context).scaffoldBackgroundColor,
          ),
          onPressed: () => widget.drawer
              ? Scaffold.of(context).openDrawer()
              : Modular.to.navigate('/home/'),
        ),
      ),
      backgroundColor: lightThemeData(context).primaryColor,
      title: Image.asset('assets/img/logo.png'),
    );
  }
}
