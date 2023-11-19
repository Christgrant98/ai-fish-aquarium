import 'package:flutter/material.dart';
import 'package:login_flutter/src/models/recognized.dart';


class PhotosPecesProvider extends ChangeNotifier {
  final Set<PezRecognized> _setPeces = <PezRecognized>{};

  Set<PezRecognized> get setPeces => _setPeces;

  void agregarPez(PezRecognized pez) {
    _setPeces.add(pez);
    Future.microtask(() {
    notifyListeners();
  });
  }
}