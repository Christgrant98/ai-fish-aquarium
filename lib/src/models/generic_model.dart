abstract class GenericModel {
  int? get id;

  Map<String, dynamic> toMap();
  factory GenericModel.fromMap(Map<String, dynamic> map) {
    throw UnimplementedError();
  }
}

