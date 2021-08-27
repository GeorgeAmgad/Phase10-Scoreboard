import 'package:moor/moor.dart';
import 'package:phase_10_score_tracker/database/database.dart';

part 'phase.g.dart';

class Phases extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get modeId => integer().customConstraint('REFERENCES modes(id)')();

  TextColumn get statement => text()();

  IntColumn get number => integer()();
}

@UseDao(tables: [Phases])
class PhasesDao extends DatabaseAccessor<AppDatabase> with _$PhasesDaoMixin {
  PhasesDao(AppDatabase db) : super(db);

  Future<List<Phase>> getAllPhasesByMode(int modeId) {
    return (select(phases)
          ..orderBy(
            ([(ph) => OrderingTerm(expression: ph.number)]),
          )
          ..where((ph) => ph.modeId.equals(modeId)))
        .get();
  }
}
