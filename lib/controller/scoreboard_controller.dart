import 'package:phase_10_score_tracker/database/database_helper.dart';
import 'package:phase_10_score_tracker/model/mode.dart';
import 'package:phase_10_score_tracker/model/scoreboard.dart';
import 'package:sqflite/sqflite.dart';

class ScoreboardCL {
  static Future<int> addScoreboard(Scoreboard scoreboard) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.insert('$boardsTable', scoreboard.toJson());
  }

  static Future<List<Scoreboard>> getScoreboards() async {
    Database db = await DatabaseHelper.instance.database;
    var boards = await db.rawQuery('''
    SELECT b.${BoardFields.id},
         b.${BoardFields.title},
         b.${BoardFields.modeId},
         m.${ModeFields.name}
       FROM $boardsTable AS b
       JOIN $modesTable AS m
       ON b.${BoardFields.modeId} = m.${ModeFields.id} 
      ''');
    print(boards);
    List<Scoreboard> boardsList = boards.isNotEmpty
        ? boards.map((e) => Scoreboard.fromJson(e)).toList()
        : [];
    return boardsList;
  }
}
