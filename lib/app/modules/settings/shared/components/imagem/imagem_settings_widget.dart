import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/modules/settings/settings_store.dart';
import 'package:veacos/app/modules/settings/shared/components/imagem/pop_menu_widget.dart';
import 'package:veacos/app/modules/settings/shared/controller/client_settings_store.dart';
import 'package:veacos/app/shared/components/circular_progress_indicator_widget.dart';

class ImagemSettingsWidget extends StatefulWidget {
  const ImagemSettingsWidget({Key? key}) : super(key: key);

  @override
  State<ImagemSettingsWidget> createState() => _ImagemSettingsWidgetState();
}

class _ImagemSettingsWidgetState extends State<ImagemSettingsWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animacaoSize;
  final ClientSettingsStore client = Modular.get();
  final SettingsStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    store.client.setting$.addListener(() {
      setState(() {});
    });
    store.client.loadingImagem$.addListener(() {
      setState(() {});
    });
    _controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animacaoSize = Tween<double>(begin: 0, end: 250).animate(
        CurvedAnimation(parent: _controller, curve: Curves.decelerate));
    return AnimatedBuilder(animation: _animacaoSize, builder: _buildAnimation);
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 30,
          child: Center(
              child: store.client.loadingImagem$.value
                  ? const CircularProgressIndicatorWidget()
                  : Container(
                      width: 170.0,
                      height: 170.0,
                      decoration: store.client.setting$.value.foto != ''
                          ? BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: CachedNetworkImageProvider(
                                  store.client.setting$.value.foto,
                                ),
                              ),
                            )
                          : const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/img/person.png'),
                              ),
                            ),
                    )),
        )
      ],
    );
  }
}
