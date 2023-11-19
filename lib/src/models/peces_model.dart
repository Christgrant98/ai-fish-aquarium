import 'package:login_flutter/src/models/generic_model.dart';
import 'user_model.dart';

class Pez implements GenericModel {
  final int? id;
  final String name;
  final String imageRoute;
  final String description;
  bool isLiked;
  final List<Map<User, String>>? comments;

  Pez({
    this.id,
    required this.name,
    required this.imageRoute,
    required this.description,
    this.isLiked = false,
    this.comments,
  });

  factory Pez.fromMap(Map<String, dynamic> map) => Pez(
        id: map["id"],
        name: map["name"],
        imageRoute: map["image_route"],
        description: map["description"],
        isLiked: map["is_liked"] ?? false,
        comments: map["comments"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "image_route": imageRoute,
        "description": description,
        "is_liked": isLiked,
        "comments": comments,
      };

  Pez copy() => Pez(
        id: id,
        name: name,
        imageRoute: imageRoute,
        description: description,
        isLiked: isLiked,
        comments: comments,
      );

  void toggleLike() {
    isLiked = !isLiked;
  }
}
