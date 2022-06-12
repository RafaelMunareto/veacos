import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/app_widget.dart';
import 'package:veacos/app/shared/auth/repositories/auth_repository.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_share.dart';
import 'package:veacos/app/shared/utils/themes/theme.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with SingleTickerProviderStateMixin {
  final ILocalStorage theme = LocalStorageShare();
  final AuthRepository auth = AuthRepository();
  bool lightMode = true;
  Color? color;

  void changeThemeStorage() async {
    await theme.get('theme').then((value) {
      if (value != null) {
        if (value.isNotEmpty) {
          setState(() {
            value?[0] == 'dark' ? lightMode = true : lightMode = false;
            AppWidget.of(context)?.changeTheme(
                value?[0] == 'dark' ? ThemeMode.dark : ThemeMode.light);
          });
        }
      }
    });
    lightMode
        ? color = darkThemeData(context).primaryColor
        : color = lightThemeData(context).primaryColor;
  }

  @override
  void initState() {
    changeThemeStorage();
    theme.get('token').then((value) {
      if (value != null) {
        if (value.isNotEmpty) {
          Modular.to.navigate('/home/');
        } else {
          Modular.to.navigate('/auth/');
        }
      } else {
        Modular.to.navigate('/auth/');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: LayoutBuilder(
        builder: (context, constraint) {
          double withDevice = constraint.maxWidth;

          if (withDevice < 600) {
            withDevice = withDevice * 0.30;
          } else if (withDevice < 960) {
            withDevice = withDevice * 0.3;
          } else if (withDevice < 1025) {
            withDevice = withDevice * 0.2;
          } else {
            withDevice = withDevice * 0.15;
          }
          return Center(
            child: SizedBox(
              width: withDevice,
              child: const Image(image: AssetImage('assets/icon/icon.png')),
            ),
          );
        },
      ),
    );
  }
}
