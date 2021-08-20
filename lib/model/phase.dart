final String phasesTable = 'phases';

class PhaseFields {
  static const String id = '_id';
  static const String modeId = 'Mode_id';
  static const String number = 'number';
  static const String statement = 'statement';
}

class Phase {
  final int? id;
  final int modeId;
  final int number;
  final String statement;

  Phase(
      {this.id,
      required this.number,
      required this.modeId,
      required this.statement});

  factory Phase.fromJson(Map<String, dynamic> json) => Phase(
      id: json['${PhaseFields.id}'],
      modeId: json['${PhaseFields.modeId}'],
      number: json['${PhaseFields.number}'],
      statement: json['${PhaseFields.statement}']);

  Map<String, dynamic> toJson() {
    return {
      '${PhaseFields.id}': id,
      '${PhaseFields.modeId}': modeId,
      '${PhaseFields.number}': number,
      '${PhaseFields.statement}': statement
    };
  }
}
