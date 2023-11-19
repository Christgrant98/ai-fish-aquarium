import 'dart:convert';

import 'package:login_flutter/src/models/explorer_activity_model.dart';
import 'package:login_flutter/src/models/generic_model.dart';
import 'package:login_flutter/src/models/peces_model.dart';
import 'package:login_flutter/src/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/comment.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDatabase();
      return _database!;
    }
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'acuario.db'),
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE peces (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, image_route TEXT, description TEXT, is_liked INTEGER, comments TEXT)',
        );

        db.execute(
          'CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT, mail TEXT, profilePicture TEXT)',
        );
        db.execute(
          'CREATE TABLE activities (id INTEGER PRIMARY KEY AUTOINCREMENT, activity TEXT, completed INTEGER, checkCompletionFunction TEXT)',
        );
      },
      version: 1,
    );
  }
}

class PezRepository extends GenericRepository<Pez> {
  @override
  String get tableName => 'peces';

  @override
  Pez fromMap(Map<String, dynamic> map) {
    final List<Comment> comments = _decodeDataComments(map['comments']);
    return Pez(
      id: map['id'],
      name: map['name'],
      imageRoute: map['image_route'],
      description: map['description'],
      isLiked: map['is_liked'] == 1,
      comments: comments,
    );
  }

  List<Comment> _decodeDataComments(String? commentsJson) {
    return (commentsJson != null)
        ? (jsonDecode(commentsJson) as List<dynamic>)
            .map((commentMap) => Comment.fromMap(commentMap))
            .toList()
        : [];
  }
}

class UserRepository extends GenericRepository<User> {
  @override
  String get tableName => 'users';

  @override
  User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      password: map['password'],
      mail: map['mail'],
      profilePicture: map['profilePicture'],
    );
  }

  Future<User?> selectUserFromCredentials(
      {required String mail, required String password}) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'mail = ? AND password = ?',
      whereArgs: [mail, password],
    );

    if (result.isNotEmpty) {
      return User(
        id: result[0]['id'],
        username: result[0]['username'],
        password: result[0]['password'],
        mail: result[0]['mail'],
        profilePicture: result[0]['profilePicture'],
      );
    }
    return null;
  }

  Future<bool> exist({required String mail}) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'mail = ?',
      whereArgs: [mail],
    );
    return result.isNotEmpty;
  }
}

class ExplorerActivityRepository extends GenericRepository<ExplorerActivity> {
  @override
  String get tableName => "activities";

  @override
  ExplorerActivity fromMap(Map<String, dynamic> map) {
    return ExplorerActivity(
      id: map['id'],
      activity: map['activity'],
      completed: map['completed'] == 1,
    );
  }
}

abstract class GenericRepository<T extends GenericModel> {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  String get tableName;
  T fromMap(Map<String, dynamic> map);

  Future<int> insert({required T item}) async {
    final db = await dbHelper.database;
    return db.insert(tableName, item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.rollback);
  }

  Future<int> delete({required int id}) async {
    final db = await dbHelper.database;
    return db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update({required T item}) async {
    final db = await dbHelper.database;
    return db
        .update(tableName, item.toMap(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<T>> getAll() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(maps.length, (index) {
      return fromMap(maps[index]);
    });
  }
}
