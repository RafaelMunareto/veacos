import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:veacos/app/modules/settings/settings_store.dart';
import 'package:veacos/app/modules/settings/shared/components/imagem/icon_imagem_widget.dart';
import 'package:veacos/app/shared/utils/themes/theme.dart';

class PopMenuWidget extends StatefulWidget {
  final String title;
  const PopMenuWidget({Key? key, this.title = "PopMenuWidget"})
      : super(key: key);

  @override
  State<PopMenuWidget> createState() => _PopMenuWidgetState();
}

class _PopMenuWidgetState extends State<PopMenuWidget> {
  SettingsStore store = Modular.get();
  CroppedFile? imageFile;
  final ImagePicker picker = Modular.get();
  List<PlatformUiSettings>? buildUiSettings(BuildContext context) {
    return [
      IOSUiSettings(
        title: 'Recortar',
      ),
    ];
  }

  _cropImage(filePath) async {
    if (filePath != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: filePath.path!,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: buildUiSettings(context),
      );
      if (croppedFile != null) {
        setState(() {
          store.atualizaImagem(image: croppedFile);
        });
      }
    }
  }

  _getFromGalleryWebMobile() async {
    XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    _cropImage(pickedFile);
  }

  _getFromCamera() async {
    XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    _cropImage(pickedFile);
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: IconImagemWidget(
        icon: Icons.photo_camera,
        color: store.client.theme
            ? darkThemeData(context).primaryColor
            : lightThemeData(context).primaryColor,
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          mouseCursor: SystemMouseCursors.click,
          onTap: () => _getFromCamera(),
          child: SizedBox(
            width: double.infinity,
            child: ListTile(
              leading: Icon(
                Icons.camera_alt,
                color: store.client.theme
                    ? darkThemeData(context).primaryColor
                    : lightThemeData(context).primaryColor,
              ),
              title: const Text(
                'Camera',
                maxLines: 1,
              ),
            ),
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          mouseCursor: SystemMouseCursors.click,
          onTap: () => _getFromGalleryWebMobile(),
          child: SizedBox(
            width: double.infinity,
            child: ListTile(
              leading: Icon(
                Icons.image,
                color: store.client.theme
                    ? darkThemeData(context).primaryColor
                    : lightThemeData(context).primaryColor,
              ),
              title: const Text(
                'Galeria',
                maxLines: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
