import 'package:moor/moor.dart';
import 'package:phase_10_score_tracker/database/database.dart';

part 'player.g.dart';

class Players extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  IntColumn get boardId =>
      integer().customConstraint('REFERENCES scoreboards(id)')();

  IntColumn get phaseId =>
      integer().customConstraint('REFERENCES phases(id)')();
}

@UseDao(tables: [Players])
class PlayersDao extends DatabaseAccessor<AppDatabase>
    with _$PlayersDaoMixin {
  PlayersDao(AppDatabase db) : super(db);


}