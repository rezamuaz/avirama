import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class TakePicturePage extends StatefulWidget {
  final CameraDescription camera;
  const TakePicturePage({super.key, required this.camera});

  @override
  State<TakePicturePage> createState() => _TakePicturePageState();
}

class _TakePicturePageState extends State<TakePicturePage> {
  CameraController? _cameraController;
  Future<void>? _initializeCameraControllerFuture;

  @override
  void initState() {
    super.initState();

    _cameraController = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _initializeCameraControllerFuture = _cameraController?.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        FutureBuilder(
          future: _initializeCameraControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(_cameraController!);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }

  void _takePicture(BuildContext context) async {
    try {
      await _initializeCameraControllerFuture;
      final path = (await getTemporaryDirectory()).path;
      await _cameraController?.takePicture();
      Navigator.pop(context, path);
    } catch (e) {
      print(e);
    }
  }
}
