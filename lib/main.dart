import 'package:flutter/material.dart';
import 'package:login_flutter/src/data/activities_data.dart';
import 'package:login_flutter/src/providers/activities_provider.dart';
import 'package:login_flutter/src/providers/peces_recognized.dart';
import 'package:login_flutter/src/providers/photos_peces.dart';
import 'package:provider/provider.dart';

import 'package:login_flutter/src/providers/carousel_provider.dart';
import 'package:login_flutter/src/utils/initialize_cameras.dart';
import 'package:login_flutter/src/app.dart';
import 'package:login_flutter/src/data/peces_data.dart';
import 'package:login_flutter/src/providers/user_provider.dart';


main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeCameras();
  carouselProvider.cargarData().then((data){
    if (data.isEmpty){
        createPeces();
    }
  });
  activityProvider.cargarData().then((data){
    if (data.isEmpty){
        createActivities();
    }
  });
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => PhotosPecesProvider()),
        ChangeNotifierProvider(create: (_) => PecesRecognizedProvider()),
      ],
      child: const MyApp(),
    ),);
}

