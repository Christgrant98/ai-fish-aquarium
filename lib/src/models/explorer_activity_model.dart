import 'package:login_flutter/src/models/generic_model.dart';


class ExplorerActivity implements GenericModel{
  @override
  final int? id;
  final String activity;
  bool? completed = false;

  ExplorerActivity({this.id, required this.activity, this.completed});

  // Getter para 'completed'
  bool? get isCompleted => completed;

  // Setter para 'completed'
  set setCompleted(bool value) {
    completed = value;
  }

  static ExplorerActivity fromMap(Map<String, dynamic> map) => ExplorerActivity(
      id: map["id"],
      activity: map["activity"],
      completed: map["completed"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "activity": activity,
        "completed": completed
      };

  @override
  String toString() {
    return activity;
  }
  
}