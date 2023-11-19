import 'package:camera/camera.dart';

late List<CameraDescription> cameras;

initializeCameras() async {
  cameras = await availableCameras();
}
