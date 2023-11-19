import 'package:login_flutter/src/models/generic_model.dart';

class User implements GenericModel{
  @override
  final int? id;
  final String username;
  final String password;
  final String mail;
  final String profilePicture;
  
  const User({
    this.id,
    required this.username,
    required this.password,
    required this.mail,
    required this.profilePicture
  });

  static User fromMap(Map<String, dynamic> map) => User(
      id: map["id"],
      username: map["username"],
      password: map["password"],
      mail: map["mail"],
      profilePicture: map["profilePicture"]);

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "password": password,
        "mail": mail,
        "profilePicture": profilePicture
      };

  User copy() => User(
      id: id, username: username,password: password, mail: mail, profilePicture: profilePicture);
}