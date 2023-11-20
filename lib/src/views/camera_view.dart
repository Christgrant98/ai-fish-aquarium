import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:login_flutter/src/utils/initialize_cameras.dart';

import '../utils/widgets/text_view.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  late CameraController controller;
  String result = "object detected";
  String fishName = "";
  int? index;
  File? _image;
  final ImagePicker _picker = ImagePicker();
  late ImageLabeler imageLabeler;
  CameraImage? img;
  CameraDescription backCamera = cameras[0];
  bool busy = false;
  @override
  bool mounted = true;

  @override
  void initState() {
    super.initState();
    controller = CameraController(backCamera, ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      controller.startImageStream((image) => {
            if (!busy) {_doStreamImageLabeling(image), busy = true}
          });
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
    _createLabeler();
  }

  @override
  void dispose() {
    mounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const Center(child: TextView(text: "Camera preview"));
    }

    return Stack(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: CameraPreview(controller),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: TextView(text: result),
        ),
        Positioned(
          bottom: 16, // Ajusta la posición vertical del botón
          width: MediaQuery.of(context)
              .size
              .width, // Ancho igual al ancho de la pantalla
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  takePicture(context);
                },
                child: const Icon(Icons.camera,
                    size: 36), // Ajusta el tamaño del icono
              ),
              const SizedBox(width: 16), // Agrega un espacio entre los botones
              IconButton(
                color: Colors.white,
                icon: const Icon(Icons.photo_library),
                onPressed: () {
                  chooseImage(context);
                },
                iconSize: 36, // Ajusta el tamaño del icono
              ),
            ],
          ),
        ),
      ],
    );
  }

  chooseImage(BuildContext context) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
      await _doImageLabeling();
      GoRouter.of(context).go('/camera_view/details',
          extra: {"image": _image, "name": fishName});
    }
  }

  _doImageLabeling() async {
    if (!mounted) {
      return;
    }
    InputImage inputImage = InputImage.fromFile(_image!);

    final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);
    result = "";
    fishName = "";
    for (ImageLabel label in labels) {
      final String text = label.label;
      final double confidence = label.confidence;
      index = label.index;
      fishName = text;
      result += "$text  ${confidence.toStringAsFixed(2)}\n";
    }
    setState(() {
      result;
      index;
    });
  }

  _doStreamImageLabeling(CameraImage image) async {
    if (!mounted) {
      return;
    }
    InputImage? inputImage = await _getInputImage(image);

    if (inputImage == null) {
      return;
    }

    final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);
    result = "";
    for (ImageLabel label in labels) {
      final String text = label.label;
      final double confidence = label.confidence;
      index = label.index;
      result += "${index.toString()} $text  ${confidence.toStringAsFixed(2)}\n";
    }
    if (!mounted) {
      return;
    }
    setState(() {
      result;
      index;
    });
    busy = false;
  }

  Future<InputImage?> _getInputImage(CameraImage image) async {
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    final Size imageSize =
        Size(image.width.toDouble(), image.height.toDouble());

    final camera = backCamera;
    final imageRotation =
        InputImageRotationValue.fromRawValue(camera.sensorOrientation);
    if (imageRotation == null) return null;

    final inputImageFormat =
        InputImageFormatValue.fromRawValue(image.format.raw);
    if (inputImageFormat == null) return null;
    int bytesPerRow = image.planes.first.bytesPerRow;
    final InputImageMetadata metadata = InputImageMetadata(
        bytesPerRow: bytesPerRow,
        size: imageSize,
        rotation: imageRotation,
        format: inputImageFormat);
    final InputImage inputImage =
        InputImage.fromBytes(bytes: bytes, metadata: metadata);
    return inputImage;
  }

  Future<String> _getModelPath(String asset) async {
    final path = '${(await getApplicationSupportDirectory()).path}/$asset';
    await Directory(dirname(path)).create(recursive: true);
    final file = File(path);
    if (!await file.exists()) {
      final byteData = await rootBundle.load(asset);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
    return file.path;
  }

  Future<void> _createLabeler() async {
    final modelPath = await _getModelPath('assets/ml/fishModel.tflite');
    final options = LocalLabelerOptions(
      confidenceThreshold: 0.5,
      modelPath: modelPath,
    );
    imageLabeler = ImageLabeler(options: options);
  }

  void takePicture(BuildContext context) async {
    if (!controller.value.isInitialized) {
      return;
    }

    try {
      final XFile picture = await controller.takePicture();
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = DateTime.now().toIso8601String();
      final photoDir = Directory("${appDir.path}/photos");
      if (!photoDir.existsSync()) {
        photoDir.createSync();
      }
      final filePath = '${photoDir.path}/$fileName.png';
      File(picture.path).copy(filePath);
      print('Imagen guardada en: $filePath');
      setState(() {
        _image = File(picture.path);
      });

      await _doImageLabeling();
      GoRouter.of(context).go('/camera_view/details',
          extra: {"image": _image, "name": fishName});
    } catch (e) {
      // Handle error taking picture
      print("Error taking picture: $e");
    }
  }
}
