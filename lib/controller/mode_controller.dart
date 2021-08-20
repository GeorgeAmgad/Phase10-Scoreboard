import 'package:phase_10_score_tracker/database/database_helper.dart';
import 'package:phase_10_score_tracker/model/mode.dart';
import 'package:sqflite/sqflite.dart';

class ModeCL {
  static Future<int> addMode(Mode mode) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.insert('$modesTable', mode.toJson());
  }

  static Future<List<Mode>> getModes() async {
    Database db = await DatabaseHelper.instance.database;
    var modes = await db.query('$modesTable');
    List<Mode> modesList =
        modes.isNotEmpty ? modes.map((e) => Mode.fromJson(e)).toList() : [];
    return modesList;
  }
}
