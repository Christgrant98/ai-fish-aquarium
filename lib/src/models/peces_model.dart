import 'package:login_flutter/src/models/generic_model.dart';

class Pez implements GenericModel{
  @override
  final int? id;
  final String name;
  final String imageRoute;
  final String description;

  const Pez(
      {
      this.id,
      required this.name,
      required this.imageRoute,
      required this.description});

  factory Pez.fromMap(Map<String, dynamic> map) => Pez(
      id: map["id"],
      name: map["name"],
      imageRoute: map["image_route"],
      description: map["description"]);

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "image_route": imageRoute,
        "description": description
      };

  @override
  String toString() {
    return name;
  }

  Pez copy() => Pez(
      id: id, name: name, imageRoute: imageRoute, description: description);
}
