import 'dart:io';
import 'dart:typed_data';

import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/dialogs/widget/x_loading_alert.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:image_editor/image_editor.dart' hide ImageSource;
import 'package:image_picker/image_picker.dart';

class CropGambar extends StatefulWidget {
  XFile? img;

  CropGambar(this.img, {super.key});

  @override
  State<CropGambar> createState() => _CropGambarState();
}

class _CropGambarState extends State<CropGambar> {
  final GlobalKey<ExtendedImageEditorState> editorKey = GlobalKey();
  late ImageProvider providerEditor;

  @override
  void initState() {
    providerEditor =
        ExtendedFileImageProvider(File(widget.img!.path), cacheRawData: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          "EDIT PHOTO",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.check,
              color: Colors.green,
            ),
            onPressed: () async {
              await crop();
            },
          ),
        ],
      ),
      body: ExtendedImage(
        image: providerEditor,
        extendedImageEditorKey: editorKey,
        mode: ExtendedImageMode.editor,
        fit: BoxFit.contain,
        initEditorConfigHandler: (_) => EditorConfig(
          maxScale: 16,
          cropRectPadding: const EdgeInsets.all(20.0),
          hitTestSize: 1,
          cropAspectRatio: 1 / 1,
        ),
      ),
      bottomNavigationBar: bottomFunctions(),
    );
  }

  Widget bottomFunctions() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.flip,
            color: Colors.green,
          ),
          label: "Flip",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.rotate_left,
            color: Colors.green,
          ),
          label: "Rotate left",
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.rotate_right,
              color: Colors.green,
            ),
            label: "Rotate right"),
      ],
      onTap: (int index) {
        switch (index) {
          case 0:
            flip();
            break;
          case 1:
            rotate(false);
            break;
          case 2:
            rotate(true);
            break;
        }
      },
      currentIndex: 0,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Theme.of(context).primaryColor,
    );
  }

  Future<void> crop() async {
    showLoading(context, message: "Sedang memproses gambar...");
    try {
      final ExtendedImageEditorState? state = editorKey.currentState;
      if (state == null) {
        return;
      }
      final Rect? rect = state.getCropRect();
      if (rect == null) {
        XToast.show('The crop rect is null.');
        return;
      }
      final EditActionDetails? action = state.editAction;
      final double radian = action!.rotateAngle;

      final bool flipHorizontal = action.flipY;
      final bool flipVertical = action.flipX;
      final Uint8List img = state.rawImageData;

      if (img == null) {
        XToast.show('The img is null.');
        return;
      }

      final ImageEditorOption option = ImageEditorOption();

      option.addOption(ClipOption.fromRect(rect));
      option.addOption(
          FlipOption(horizontal: flipHorizontal, vertical: flipVertical));
      if (action.hasRotateAngle) {
        option.addOption(RotateOption(radian.toInt()));
      }

      option.outputFormat = const OutputFormat.png(10);
      final Uint8List? result = await ImageEditor.editImage(
        image: img,
        imageEditorOption: option,
      );
      hideLoading();
      if (result != null) {
        Navigator.pop(context, result);
      } else {
        Navigator.pop(context, false);
      }
    } catch (e) {
      print(e.toString());
      hideLoading();
    }
  }

  void flip() {
    editorKey.currentState?.flip();
  }

  void rotate(bool right) {
    editorKey.currentState?.rotate(right: right);
  }
}
