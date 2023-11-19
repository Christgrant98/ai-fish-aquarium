import 'package:flutter/material.dart';
import 'package:login_flutter/src/models/recognized.dart';


class PecesRecognizedProvider extends ChangeNotifier {
  final List<PezRecognized> _listaDePeces = [
  const PezRecognized(
    name: "Bangus",
    tipoAgua: TipoAgua.aguaSalada,
    tipoAlimentacion: TipoAlimentacion.omnivoro,
  ),
  const PezRecognized(
    name: "Big Head Carp",
    tipoAgua: TipoAgua.aguaDulce,
    tipoAlimentacion: TipoAlimentacion.herbivoro,
  ),
  const PezRecognized(
    name: "Black Spotted Barb",
    tipoAgua: TipoAgua.aguaDulce,
    tipoAlimentacion: TipoAlimentacion.omnivoro,
  ),
  const PezRecognized(
    name: "Catfish",
    tipoAgua: TipoAgua.aguaDulce,
    tipoAlimentacion: TipoAlimentacion.carnivoro,
  ),
  const PezRecognized(
    name: "Climbing Perch",
    tipoAgua: TipoAgua.aguaDulce,
    tipoAlimentacion: TipoAlimentacion.omnivoro,
  ),
  const PezRecognized(
    name: "Fourfinger Threadfin",
    tipoAgua: TipoAgua.aguaSalada,
    tipoAlimentacion: TipoAlimentacion.carnivoro,
  ),
  const PezRecognized(
    name: "Freshwater Eel",
    tipoAgua: TipoAgua.aguaDulce,
    tipoAlimentacion: TipoAlimentacion.carnivoro,
  ),
  const PezRecognized(
    name: "Glass Perchlet",
    tipoAgua: TipoAgua.aguaSalada,
    tipoAlimentacion: TipoAlimentacion.omnivoro,
  ),
  const PezRecognized(
    name: "Goby",
    tipoAgua: TipoAgua.aguaSalada,
    tipoAlimentacion: TipoAlimentacion.omnivoro,
  ),
  const PezRecognized(
    name: "Gold Fish",
    tipoAgua: TipoAgua.aguaDulce,
    tipoAlimentacion: TipoAlimentacion.omnivoro,
  ),
  const PezRecognized(
    name: "Gourami",
    tipoAgua: TipoAgua.aguaDulce,
    tipoAlimentacion: TipoAlimentacion.omnivoro,
  ),
  const PezRecognized(
    name: "Grass Carp",
    tipoAgua: TipoAgua.aguaDulce,
    tipoAlimentacion: TipoAlimentacion.herbivoro,
  ),
  const PezRecognized(
    name: "Green Spotted Puffer",
    tipoAgua: TipoAgua.aguaSalada,
    tipoAlimentacion: TipoAlimentacion.carnivoro,
  ),
  const PezRecognized(
    name: "Indian Carp",
    tipoAgua: TipoAgua.aguaDulce,
    tipoAlimentacion: TipoAlimentacion.herbivoro,
  ),
  const PezRecognized(
    name: "Indo-Pacific Tarpon",
    tipoAgua: TipoAgua.aguaSalada,
    tipoAlimentacion: TipoAlimentacion.carnivoro,
  ),
  const PezRecognized(
    name: "Jaguar Gapote",
    tipoAgua: TipoAgua.aguaSalada,
    tipoAlimentacion: TipoAlimentacion.carnivoro,
  ),
  const PezRecognized(
    name: "Janitor Fish",
    tipoAgua: TipoAgua.aguaDulce,
    tipoAlimentacion: TipoAlimentacion.omnivoro,
  ),
  const PezRecognized(
    name: "Knifefish",
    tipoAgua: TipoAgua.aguaDulce,
    tipoAlimentacion: TipoAlimentacion.carnivoro,
  ),
  const PezRecognized(
    name: "Long-Snouted Pipefish",
    tipoAgua: TipoAgua.aguaSalada,
    tipoAlimentacion: TipoAlimentacion.carnivoro,
  ),
  const PezRecognized(
    name: "Mosquito Fish",
    tipoAgua: TipoAgua.aguaDulce,
    tipoAlimentacion: TipoAlimentacion.omnivoro,
  ),
  const PezRecognized(
    name: "Mudfish",
    tipoAgua: TipoAgua.aguaDulce,
    tipoAlimentacion: TipoAlimentacion.omnivoro,
  ),
  const PezRecognized(
    name: "Mullet",
    tipoAgua: TipoAgua.aguaSalada,
    tipoAlimentacion: TipoAlimentacion.omnivoro,
  ),
  const PezRecognized(
    name: "Pangasius",
    tipoAgua: TipoAgua.aguaDulce,
    tipoAlimentacion: TipoAlimentacion.omnivoro,
  ),
  const PezRecognized(
    name: "Perch",
    tipoAgua: TipoAgua.aguaDulce,
    tipoAlimentacion: TipoAlimentacion.carnivoro,
  ),
  const PezRecognized(
    name: "Scat Fish",
    tipoAgua: TipoAgua.aguaDulce,
    tipoAlimentacion: TipoAlimentacion.omnivoro,
  ),
  const PezRecognized(
    name: "Silver Barb",
    tipoAgua: TipoAgua.aguaDulce,
    tipoAlimentacion: TipoAlimentacion.omnivoro,
  ),
  const PezRecognized(
    name: "Silver Carp",
    tipoAgua: TipoAgua.aguaDulce,
    tipoAlimentacion: TipoAlimentacion.herbivoro,
  ),
  const PezRecognized(
    name: "Silver Perch",
    tipoAgua: TipoAgua.aguaDulce,
    tipoAlimentacion: TipoAlimentacion.omnivoro,
  ),
  const PezRecognized(
    name: "Snakehead",
    tipoAgua: TipoAgua.aguaDulce,
    tipoAlimentacion: TipoAlimentacion.carnivoro,
  ),
  const PezRecognized(
    name: "Tenpounder",
    tipoAgua: TipoAgua.aguaSalada,
    tipoAlimentacion: TipoAlimentacion.omnivoro,
  ),
  const PezRecognized(
    name: "Tilapia",
    tipoAgua: TipoAgua.aguaDulce,
    tipoAlimentacion: TipoAlimentacion.omnivoro,
  ),
];

  List<PezRecognized> get listaDePeces => _listaDePeces;

  void agregarPez(PezRecognized pez) {
    _listaDePeces.add(pez);
  Future.microtask(() {
      notifyListeners();
    });
  }

  PezRecognized? getPezPorNombre(String nombre) {
    for (var pez in _listaDePeces) {
      if (pez.name == nombre) {
        return pez;
      }
    }
    return null;
  }
}