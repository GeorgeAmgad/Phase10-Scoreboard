import 'package:phase_10_score_tracker/model/mode.dart';
import 'package:phase_10_score_tracker/model/phase.dart';
import 'package:sqflite/sqflite.dart';

Future<void> addModesAndPhases(Database db, int version) async {
  Batch batch = db.batch();
  switch (version) {
    case 1:
      {
        int classicId =
            await db.insert(modesTable, Mode(name: 'Classic').toJson());
        int twistId = await db.insert(modesTable, Mode(name: 'Twist').toJson());

        batch.insert(phasesTable, {
          '${PhaseFields.number}': 1,
          '${PhaseFields.modeId}': classicId,
          '${PhaseFields.statement}': '2 sets of 3'
        });
        batch.insert(phasesTable, {
          '${PhaseFields.number}': 2,
          '${PhaseFields.modeId}': classicId,
          '${PhaseFields.statement}': '1 set of 3 + 1 run of 4'
        });
        batch.insert(phasesTable, {
          '${PhaseFields.number}': 3,
          '${PhaseFields.modeId}': classicId,
          '${PhaseFields.statement}': '1 set of 4 + 1 run of 4'
        });
        batch.insert(phasesTable, {
          '${PhaseFields.number}': 4,
          '${PhaseFields.modeId}': classicId,
          '${PhaseFields.statement}': '1 run of 7'
        });
        batch.insert(phasesTable, {
          '${PhaseFields.number}': 5,
          '${PhaseFields.modeId}': classicId,
          '${PhaseFields.statement}': '1 run of 8'
        });
        batch.insert(phasesTable, {
          '${PhaseFields.number}': 6,
          '${PhaseFields.modeId}': classicId,
          '${PhaseFields.statement}': ' 1 run of 9'
        });
        batch.insert(phasesTable, {
          '${PhaseFields.number}': 7,
          '${PhaseFields.modeId}': classicId,
          '${PhaseFields.statement}': '2 sets of 4'
        });
        batch.insert(phasesTable, {
          '${PhaseFields.number}': 8,
          '${PhaseFields.modeId}': classicId,
          '${PhaseFields.statement}': '7 cards of one color'
        });
        batch.insert(phasesTable, {
          '${PhaseFields.number}': 9,
          '${PhaseFields.modeId}': classicId,
          '${PhaseFields.statement}': '1 set of 5 + 1 set of 2'
        });
        batch.insert(phasesTable, {
          '${PhaseFields.number}': 10,
          '${PhaseFields.modeId}': classicId,
          '${PhaseFields.statement}': '1 set of 5 + 1 set of 3'
        });

        // twist phases
        batch.insert(phasesTable, {
          '${PhaseFields.number}': 1,
          '${PhaseFields.modeId}': twistId,
          '${PhaseFields.statement}': '3 sets of 3'
        });
        batch.insert(phasesTable, {
          '${PhaseFields.number}': 2,
          '${PhaseFields.modeId}': twistId,
          '${PhaseFields.statement}': '4 sets of 2'
        });
        batch.insert(phasesTable, {
          '${PhaseFields.number}': 3,
          '${PhaseFields.modeId}': twistId,
          '${PhaseFields.statement}': '1 set of 5 + 1 run of 4'
        });
        batch.insert(phasesTable, {
          '${PhaseFields.number}': 4,
          '${PhaseFields.modeId}': twistId,
          '${PhaseFields.statement}': '2 sets of 3 + 1 run of 3'
        });
        batch.insert(phasesTable, {
          '${PhaseFields.number}': 5,
          '${PhaseFields.modeId}': twistId,
          '${PhaseFields.statement}': '1 set of 3 + 1 run of 6'
        });
        batch.insert(phasesTable, {
          '${PhaseFields.number}': 6,
          '${PhaseFields.modeId}': twistId,
          '${PhaseFields.statement}': '2 runs of 4'
        });
        batch.insert(phasesTable, {
          '${PhaseFields.number}': 7,
          '${PhaseFields.modeId}': twistId,
          '${PhaseFields.statement}': '1 run of 4 + 4 cards of one color'
        });
        batch.insert(phasesTable, {
          '${PhaseFields.number}': 8,
          '${PhaseFields.modeId}': twistId,
          '${PhaseFields.statement}': '1 run of 5 of one color'
        });
        batch.insert(phasesTable, {
          '${PhaseFields.number}': 9,
          '${PhaseFields.modeId}': twistId,
          '${PhaseFields.statement}': '8 cards of one color'
        });
        batch.insert(phasesTable, {
          '${PhaseFields.number}': 10,
          '${PhaseFields.modeId}': twistId,
          '${PhaseFields.statement}': '9 cards of one color'
        });
        break;
      }
    case 2:
  }
  await batch.commit(noResult: true);
}
