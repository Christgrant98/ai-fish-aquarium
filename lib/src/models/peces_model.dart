import 'dart:convert';

import 'package:login_flutter/src/models/comment.dart';
import 'package:login_flutter/src/models/generic_model.dart';

class Pez implements GenericModel {
  final int? id;
  final String name;
  final String imageRoute;
  final String description;
  bool isLiked;
  final List<Comment>? comments;

  Pez({
    this.id,
    required this.name,
    required this.imageRoute,
    required this.description,
    this.isLiked = false,
    this.comments,
  });

  factory Pez.fromMap(Map<String, dynamic> map) {
    return Pez(
      id: map["id"],
      name: map["name"],
      imageRoute: map["image_route"],
      description: map["description"],
      isLiked: map["is_liked"] ?? false,
      comments: (map["comments"] as List<dynamic>?)
          ?.map((commentMap) => Comment.fromMap(commentMap))
          .toList(),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "image_route": imageRoute,
      "description": description,
      "is_liked":
          isLiked ? 1 : 0, // Convertir el bool a un valor compatible con SQLite
      "comments":
          jsonEncode(comments?.map((comment) => comment.toMap()).toList()),
    };
  }

  Pez copy() {
    return Pez(
      id: id,
      name: name,
      imageRoute: imageRoute,
      description: description,
      isLiked: isLiked,
      comments: comments,
    );
  }

  void toggleLike() {
    isLiked = !isLiked;
  }
}
