// ignore_for_file: unused_local_variable
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/app_widget.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:veacos/app/shared/repositories/localstorage/local_storage_share.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with SingleTickerProviderStateMixin {
  final ILocalStorage storage = LocalStorageShare();
  bool lightMode = true;
  Color? color;
  late AnimationController _controller;
  late Animation<double> opacidade;

  void changeThemeStorage() async {
    await storage.get('theme').then((value) {
      if (value != null) {
        if (value.isNotEmpty) {
          setState(() {
            value?[0] == 'dark' ? lightMode = true : lightMode = false;
            AppWidget.of(context)
                ?.changeTheme(value?[0] ? ThemeMode.dark : ThemeMode.light);
            lightMode
                ? color = const Color.fromARGB(255, 244, 245, 247)
                : color = const Color(0xff042a49);
          });
        }
      }
    });
  }

  @override
  void initState() {
    changeThemeStorage();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _controller.forward();
    Timer(const Duration(seconds: 1), () => Modular.to.navigate('/home/'));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    opacidade = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0.1, 0.8)));

    return AnimatedBuilder(
      animation: _controller,
      builder: _buildAnimation,
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Scaffold(
      body: FadeTransition(
        opacity: opacidade,
        child: LayoutBuilder(
          builder: (context, constraint) {
            double withDevice = constraint.maxWidth;

            if (withDevice < 600) {
              withDevice = withDevice * 0.58;
            } else if (withDevice < 960) {
              withDevice = withDevice * 0.3;
            } else if (withDevice < 1025) {
              withDevice = withDevice * 0.2;
            } else {
              withDevice = withDevice * 0.15;
            }
            return Center(
              child: Container(
                color: color,
                width: withDevice,
                child: const Image(image: AssetImage('assets/icon/icon.png')),
              ),
            );
          },
        ),
      ),
    );
  }
}
