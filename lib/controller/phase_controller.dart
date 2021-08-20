import 'package:phase_10_score_tracker/database/database_helper.dart';
import 'package:phase_10_score_tracker/model/phase.dart';
import 'package:sqflite/sqflite.dart';

class PhaseCL {
  static Future<Phase> getPhase(int modeId, int number) async {
    Database db = await DatabaseHelper.instance.database;
    var phase = await db.query(phasesTable,
        where: '${PhaseFields.modeId} = ? AND ${PhaseFields.number} = ?',
        whereArgs: [modeId, number]);
    // the phase list should assertively contain only one item,
    // anything else is a duplication or error and TODO: should be handled
    return phase.isNotEmpty
        ? Phase.fromJson(phase[0])
        : Phase(number: 1, modeId: 1, statement: "something went wrong");
  }

  static Future<List<Phase>> getModePhases(int modeId) async {
    Database db = await DatabaseHelper.instance.database;
    var phases = await db.query(phasesTable,
        where: '${PhaseFields.modeId} = ?',
        whereArgs: [modeId],
        orderBy: '${PhaseFields.number}');
    print(phases);
    List<Phase> phaseList =
        phases.isNotEmpty ? phases.map((e) => Phase.fromJson(e)).toList() : [];
    return phaseList;
  }
}
