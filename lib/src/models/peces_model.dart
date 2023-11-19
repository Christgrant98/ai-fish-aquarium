import 'package:login_flutter/src/models/generic_model.dart';

class Pez implements GenericModel {
  final int? id;
  final String name;
  final String imageRoute;
  final String description;
  bool isLiked;

  Pez({
    this.id,
    required this.name,
    required this.imageRoute,
    required this.description,
    this.isLiked = false,
  });

  factory Pez.fromMap(Map<String, dynamic> map) => Pez(
        id: map["id"],
        name: map["name"],
        imageRoute: map["image_route"],
        description: map["description"],
        isLiked: map["is_liked"] ?? false,
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "image_route": imageRoute,
        "description": description,
        "is_liked": isLiked,
      };

  Pez copy() => Pez(
        id: id,
        name: name,
        imageRoute: imageRoute,
        description: description,
        isLiked: isLiked,
      );

  void toggleLike() {
    isLiked = !isLiked;
  }
}
