final String modesTable = 'modes';

class ModeFields {
  static const String id = '_id';
  static const String name = 'name';
}


class Mode {
  final int? id;
  final String name;

  Mode({this.id, required this.name});

  factory Mode.fromJson(Map<String, dynamic> json) =>
      Mode(id: json['${ModeFields.id}'], name: json['${ModeFields.name}']);

  Map<String, dynamic> toJson() {
    return {
      '${ModeFields.id}': id,
      '${ModeFields.name}': name
    };
  }
}
