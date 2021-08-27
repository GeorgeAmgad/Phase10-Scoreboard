import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:phase_10_score_tracker/model/mode.dart';
import 'package:phase_10_score_tracker/model/phase.dart';
import 'package:phase_10_score_tracker/model/player.dart';
import 'package:phase_10_score_tracker/model/scoreboard.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(
    tables: [Modes, Phases, Scoreboards, Players],
    daos: [ModesDao, PhasesDao, ScoreboardsDao, PlayersDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (_) async {
        await customStatement('PRAGMA foreign_keys = ON;');

        final classicId =
            await into(modes).insert(ModesCompanion(name: Value('Classic')));
        final twistId =
            await into(modes).insert(ModesCompanion(name: Value('Twist')));
        final islandId =
            await into(modes).insert(ModesCompanion(name: Value('Island Paradise')));

        final tenPlusTen =
        await into(modes).insert(ModesCompanion(name: Value('10 + 10')));

        await batch((batch) {
          batch.insertAll(phases, [
            PhasesCompanion.insert(modeId: classicId, statement: '2 sets of 3', number: 1),
            PhasesCompanion.insert(modeId: classicId, statement: '1 set of 3 + 1 run of 4', number: 2),
            PhasesCompanion.insert(modeId: classicId, statement: '1 set of 4 + 1 run of 4', number: 3),
            PhasesCompanion.insert(modeId: classicId, statement: '1 run of 7', number: 4),
            PhasesCompanion.insert(modeId: classicId, statement: '1 run of 8', number: 5),
            PhasesCompanion.insert(modeId: classicId, statement: '1 run of 9', number: 6),
            PhasesCompanion.insert(modeId: classicId, statement: '2 sets of 4', number: 7),
            PhasesCompanion.insert(modeId: classicId, statement: '7 cards of one color', number: 8),
            PhasesCompanion.insert(modeId: classicId, statement: '1 set of 5 + 1 set of 2', number: 9),
            PhasesCompanion.insert(modeId: classicId, statement: '1 set of 5 + 1 set of 3', number: 10),
            PhasesCompanion.insert(modeId: classicId, statement: 'Winner!', number: 11),

            PhasesCompanion.insert(modeId: twistId, statement: '3 sets of 3', number: 1),
            PhasesCompanion.insert(modeId: twistId, statement: '4 sets of 2', number: 2),
            PhasesCompanion.insert(modeId: twistId, statement: '1 set of 5 + 1 run of 4', number: 3),
            PhasesCompanion.insert(modeId: twistId, statement: '2 sets of 3 + 1 run of 3', number: 4),
            PhasesCompanion.insert(modeId: twistId, statement: '1 set of 3 + 1 run of 6', number: 5),
            PhasesCompanion.insert(modeId: twistId, statement: '2 runs of 4', number: 6),
            PhasesCompanion.insert(modeId: twistId, statement: '1 run of 4 + 4 cards of one color', number: 7),
            PhasesCompanion.insert(modeId: twistId, statement: '1 run of 5 of one color', number: 8),
            PhasesCompanion.insert(modeId: twistId, statement: '8 cards of one color', number: 9),
            PhasesCompanion.insert(modeId: twistId, statement: '9 cards of one color', number: 10),
            PhasesCompanion.insert(modeId: twistId, statement: 'Winner!', number: 11),

            PhasesCompanion.insert(modeId: islandId, statement: '1 run of 7', number: 1),
            PhasesCompanion.insert(modeId: islandId, statement: '1 set of 2 + 2 sets of 3', number: 2),
            PhasesCompanion.insert(modeId: islandId, statement: '1 run of 6 + 1 set of 2', number: 3),
            PhasesCompanion.insert(modeId: islandId, statement: '3 sets of 2 + 1 set of 3', number: 4),
            PhasesCompanion.insert(modeId: islandId, statement: '1 set of 3 + 1 run of 6', number: 5),
            PhasesCompanion.insert(modeId: islandId, statement: '2 runs of 4', number: 6),
            PhasesCompanion.insert(modeId: islandId, statement: '3 cards of one color + 1 set of 4', number: 7),
            PhasesCompanion.insert(modeId: islandId, statement: '8 cards of one color', number: 8),
            PhasesCompanion.insert(modeId: islandId, statement: '4 cards of one color + 1 set of 5', number: 9),
            PhasesCompanion.insert(modeId: islandId, statement: '9 cards of one color', number: 10),
            PhasesCompanion.insert(modeId: islandId, statement: 'Winner!', number: 11),

            PhasesCompanion.insert(modeId: tenPlusTen, statement: '2 sets of 3', number: 1),
            PhasesCompanion.insert(modeId: tenPlusTen, statement: '1 set of 3 + 1 run of 4', number: 2),
            PhasesCompanion.insert(modeId: tenPlusTen, statement: '1 set of 4 + 1 run of 4', number: 3),
            PhasesCompanion.insert(modeId: tenPlusTen, statement: '1 run of 7', number: 4),
            PhasesCompanion.insert(modeId: tenPlusTen, statement: '1 run of 8', number: 5),
            PhasesCompanion.insert(modeId: tenPlusTen, statement: '1 run of 9', number: 6),
            PhasesCompanion.insert(modeId: tenPlusTen, statement: '2 sets of 4', number: 7),
            PhasesCompanion.insert(modeId: tenPlusTen, statement: '7 cards of one color', number: 8),
            PhasesCompanion.insert(modeId: tenPlusTen, statement: '1 set of 5 + 1 set of 2', number: 9),
            PhasesCompanion.insert(modeId: tenPlusTen, statement: '1 set of 5 + 1 set of 3', number: 10),
            PhasesCompanion.insert(modeId: tenPlusTen, statement: '4 sets of 2', number: 11),
            PhasesCompanion.insert(modeId: tenPlusTen, statement: '1 set of 4 + 1 run of 5', number: 12),
            PhasesCompanion.insert(modeId: tenPlusTen, statement: '1 set of 5 + 1 run of 5', number: 13),
            PhasesCompanion.insert(modeId: tenPlusTen, statement: '1 run of 4 + 4 cards of one color', number: 14),
            PhasesCompanion.insert(modeId: tenPlusTen, statement: '1 run of 5 + 4 cards of one color', number: 15),
            PhasesCompanion.insert(modeId: tenPlusTen, statement: '1 run of 10', number: 16),
            PhasesCompanion.insert(modeId: tenPlusTen, statement: '1 set of 4 + 1 set of 5', number: 17),
            PhasesCompanion.insert(modeId: tenPlusTen, statement: '9 cards of one color', number: 18),
            PhasesCompanion.insert(modeId: tenPlusTen, statement: '1 set of 6 + 1 set of 2', number: 19),
            PhasesCompanion.insert(modeId: tenPlusTen, statement: '1 set of 6 + 1 set of 3', number: 20),
            PhasesCompanion.insert(modeId: tenPlusTen, statement: 'Winner!', number: 21),
          ]);
        });
      },
    );
  }
}
