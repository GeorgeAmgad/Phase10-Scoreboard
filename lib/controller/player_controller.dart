import 'package:phase_10_score_tracker/database/database_helper.dart';
import 'package:phase_10_score_tracker/model/phase.dart';
import 'package:phase_10_score_tracker/model/player.dart';
import 'package:sqflite/sqflite.dart';

class PlayerCL {
  // TODO: if insertion failed, this should throw exception
  static Future<int> addPlayer(Player player) async {
    Database db = await DatabaseHelper.instance.database;
    var id = await db.insert('$playersTable', player.toJson());
    print(id);
    return id;
  }

  static Future<List<Player>> getPLayers(int boardId) async {
    Database db = await DatabaseHelper.instance.database;
    var players = await db.rawQuery('''
    SELECT p.${PlayerFields.id},
      p.${PlayerFields.name},
      p.${PlayerFields.boardId},
      p.${PlayerFields.phaseId},
      ph.${PhaseFields.number},
      ph.${PhaseFields.modeId},
      ph.${PhaseFields.statement}
      FROM $playersTable AS p
      JOIN $phasesTable AS ph
      ON p.${PlayerFields.phaseId} = ph.${PhaseFields.modeId}
      WHERE p.${PlayerFields.boardId} = ?''', [boardId]);
    print(players);
    List<Player> playersList = players.isNotEmpty
        ? players.map((e) => Player.fromJson(e)).toList()
        : [];
    return playersList;
  }

  static Future<List<String>> getPlayersNames(int boardId) async {
    Database db = await DatabaseHelper.instance.database;
    var names = await db.query(playersTable,
        columns: [PlayerFields.name],
        where: '${PlayerFields.boardId} = ?',
        whereArgs: [boardId]);
    print(names);
    List<String> playersNames =
        names.isNotEmpty ? names.map((e) => e.toString()).toList() : [];
    return playersNames;
  }
}
