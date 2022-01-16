import 'package:moor/moor.dart';
import 'package:phase_10_score_tracker/database/database.dart';

part 'score.g.dart';

class Scores extends Table {
  IntColumn get playerId => integer().customConstraint('REFERENCES players(id)')();

  IntColumn get boardId => integer().customConstraint('REFERENCES scoreboards(id)')();

  IntColumn get round =>  integer()();

  IntColumn get score => integer()();
}

@UseDao(tables: [Scores])
class ScoresDao extends DatabaseAccessor<AppDatabase> with _$ScoresDaoMixin {
  ScoresDao(AppDatabase db) : super(db);

}
