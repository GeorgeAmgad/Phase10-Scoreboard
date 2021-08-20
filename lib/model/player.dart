import 'phase.dart';

final String playersTable = 'players';

class PlayerFields {
  static const String id = '_id';
  static const String name = 'name';
  static const String boardId = 'board_id';
  static const String phaseId = 'phase_id';
}

class Player {
  final int? id;
  final String name;
  final int boardId;
  Phase phase;

  Player(
      {this.id,
      required this.name,
      required this.boardId,
      required this.phase});

  factory Player.fromJson(Map<String, dynamic> json) => Player(
      id: json['${PlayerFields.id}'],
      name: json['${PlayerFields.name}'],
      boardId: json['${PlayerFields.boardId}'],
      phase: Phase(
          id: json['${PlayerFields.phaseId}'],
          number: json['${PhaseFields.number}'],
          modeId: json['${PhaseFields.modeId}'],
          statement: json['${PhaseFields.statement}']
      )
  );

  Map<String, dynamic> toJson() {
    return {
      '${PlayerFields.id}': id,
      '${PlayerFields.name}': name,
      '${PlayerFields.boardId}': boardId,
      '${PlayerFields.phaseId}': phase.id
    };
  }

}
