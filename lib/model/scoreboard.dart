import 'package:phase_10_score_tracker/controller/phase_controller.dart';
import 'package:phase_10_score_tracker/controller/player_controller.dart';
import 'package:phase_10_score_tracker/database/database_helper.dart';

import 'mode.dart';
import 'player.dart';

final String boardsTable = 'scoreboards';

class BoardFields {
  static const String id = '_id';
  static const String title = 'title';
  static const String modeId = 'mode_id';
}

class Scoreboard {
  final int? id;
  final String title;
  final Mode mode;

  PlayerCL controller = PlayerCL();


  List<String>? _playersNames;
  List<Player>? _players;

  Scoreboard({this.id, required this.title, required this.mode});

  Future<List<String>> get playersNames async =>
      _playersNames ??= await PlayerCL.getPlayersNames(id!);

  Future<List<Player>> get players async =>
      _players ??= await PlayerCL.getPLayers(id!);

  factory Scoreboard.fromJson(Map<String, dynamic> json) => Scoreboard(
      id: json['${BoardFields.id}'],
      title: json['${BoardFields.title}'],
      mode: Mode(
          id: json['${BoardFields.modeId}'], name: json['${ModeFields.name}']));

  Map<String, dynamic> toJson() {
    return {
      '${BoardFields.id}': id,
      '${BoardFields.title}': title,
      '${BoardFields.modeId}': mode.id
    };
  }

  Future<bool> addNewPlayer(String name) async {
    try {
      Player player = Player(
          name: name,
          boardId: this.id!,
          phase: await PhaseCL.getPhase(mode.id!, 1));
      await PlayerCL.addPlayer(player);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
