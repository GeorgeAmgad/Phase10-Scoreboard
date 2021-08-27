import 'package:moor/moor.dart';
import 'package:phase_10_score_tracker/database/database.dart';

part 'mode.g.dart';


class Modes extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 50)();
}


@UseDao(tables: [Modes])
class ModesDao extends DatabaseAccessor<AppDatabase>
    with _$ModesDaoMixin {
  ModesDao(AppDatabase db) : super(db);

  Future<List<Mode>> getAllModes() => select(modes).get();
}