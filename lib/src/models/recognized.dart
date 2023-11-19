enum TipoAgua {
  aguaDulce,
  aguaSalada,
}

enum TipoAlimentacion {
  carnivoro,
  herbivoro,
  omnivoro,
}

class PezRecognized{
  final String name;
  final TipoAgua tipoAgua;
  final TipoAlimentacion tipoAlimentacion;

  const PezRecognized(
      {
      required this.name,
      required this.tipoAgua,
      required this.tipoAlimentacion
      }
      );

  factory PezRecognized.fromMap(Map<String, dynamic> map) => PezRecognized(
      name: map["name"],
      tipoAgua: map["tipoAgua"],
      tipoAlimentacion: map["tipoAlimentacion"]);

  Map<String, dynamic> toMap() => {
        "name": name,
        "tipoAgua": tipoAgua,
        "tipoAlimentacion": tipoAlimentacion
      };
}