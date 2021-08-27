import 'package:moor/moor.dart';
import 'package:phase_10_score_tracker/database/database.dart';

import 'mode.dart';

part 'scoreboard.g.dart';

class Scoreboards extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get modeId => integer().customConstraint('REFERENCES modes(id)')();

  TextColumn get title => text()();

  IntColumn get round => integer().withDefault(Constant(1))();

  DateTimeColumn get creationDate => dateTime()();
}

@UseDao(tables: [Scoreboards, Modes])
class ScoreboardsDao extends DatabaseAccessor<AppDatabase>
    with _$ScoreboardsDaoMixin {
  ScoreboardsDao(AppDatabase db) : super(db);

  Future insertBoard(Insertable<Scoreboard> board) =>
      into(scoreboards).insert(board);

  Future deleteBoard(Insertable<Scoreboard> board) =>
      delete(scoreboards).delete(board);

  Stream<List<ScoreboardWithMode>> scoreboardsWithMode() {
    final query = select(scoreboards)
        .join([innerJoin(modes, modes.id.equalsExp(scoreboards.modeId))]);

    return query.watch().map((rows) {
      return rows.map((row) {
        return ScoreboardWithMode(
            scoreboard: row.readTable(scoreboards), mode: row.readTable(modes));
      }).toList();
    });
  }
}

class ScoreboardWithMode {
  final Scoreboard scoreboard;
  final Mode mode;

  ScoreboardWithMode({required this.scoreboard, required this.mode});
}
