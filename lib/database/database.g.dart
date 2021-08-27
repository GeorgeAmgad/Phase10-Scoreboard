// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Mode extends DataClass implements Insertable<Mode> {
  final int id;
  final String name;
  Mode({required this.id, required this.name});
  factory Mode.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Mode(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  ModesCompanion toCompanion(bool nullToAbsent) {
    return ModesCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Mode.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Mode(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Mode copyWith({int? id, String? name}) => Mode(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Mode(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Mode && other.id == this.id && other.name == this.name);
}

class ModesCompanion extends UpdateCompanion<Mode> {
  final Value<int> id;
  final Value<String> name;
  const ModesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  ModesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Mode> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  ModesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return ModesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ModesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ModesTable extends Modes with TableInfo<$ModesTable, Mode> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ModesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'modes';
  @override
  String get actualTableName => 'modes';
  @override
  VerificationContext validateIntegrity(Insertable<Mode> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Mode map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Mode.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ModesTable createAlias(String alias) {
    return $ModesTable(_db, alias);
  }
}

class Phase extends DataClass implements Insertable<Phase> {
  final int id;
  final int modeId;
  final String statement;
  final int number;
  Phase(
      {required this.id,
      required this.modeId,
      required this.statement,
      required this.number});
  factory Phase.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Phase(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      modeId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}mode_id'])!,
      statement: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}statement'])!,
      number: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}number'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['mode_id'] = Variable<int>(modeId);
    map['statement'] = Variable<String>(statement);
    map['number'] = Variable<int>(number);
    return map;
  }

  PhasesCompanion toCompanion(bool nullToAbsent) {
    return PhasesCompanion(
      id: Value(id),
      modeId: Value(modeId),
      statement: Value(statement),
      number: Value(number),
    );
  }

  factory Phase.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Phase(
      id: serializer.fromJson<int>(json['id']),
      modeId: serializer.fromJson<int>(json['modeId']),
      statement: serializer.fromJson<String>(json['statement']),
      number: serializer.fromJson<int>(json['number']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'modeId': serializer.toJson<int>(modeId),
      'statement': serializer.toJson<String>(statement),
      'number': serializer.toJson<int>(number),
    };
  }

  Phase copyWith({int? id, int? modeId, String? statement, int? number}) =>
      Phase(
        id: id ?? this.id,
        modeId: modeId ?? this.modeId,
        statement: statement ?? this.statement,
        number: number ?? this.number,
      );
  @override
  String toString() {
    return (StringBuffer('Phase(')
          ..write('id: $id, ')
          ..write('modeId: $modeId, ')
          ..write('statement: $statement, ')
          ..write('number: $number')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(modeId.hashCode, $mrjc(statement.hashCode, number.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Phase &&
          other.id == this.id &&
          other.modeId == this.modeId &&
          other.statement == this.statement &&
          other.number == this.number);
}

class PhasesCompanion extends UpdateCompanion<Phase> {
  final Value<int> id;
  final Value<int> modeId;
  final Value<String> statement;
  final Value<int> number;
  const PhasesCompanion({
    this.id = const Value.absent(),
    this.modeId = const Value.absent(),
    this.statement = const Value.absent(),
    this.number = const Value.absent(),
  });
  PhasesCompanion.insert({
    this.id = const Value.absent(),
    required int modeId,
    required String statement,
    required int number,
  })  : modeId = Value(modeId),
        statement = Value(statement),
        number = Value(number);
  static Insertable<Phase> custom({
    Expression<int>? id,
    Expression<int>? modeId,
    Expression<String>? statement,
    Expression<int>? number,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (modeId != null) 'mode_id': modeId,
      if (statement != null) 'statement': statement,
      if (number != null) 'number': number,
    });
  }

  PhasesCompanion copyWith(
      {Value<int>? id,
      Value<int>? modeId,
      Value<String>? statement,
      Value<int>? number}) {
    return PhasesCompanion(
      id: id ?? this.id,
      modeId: modeId ?? this.modeId,
      statement: statement ?? this.statement,
      number: number ?? this.number,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (modeId.present) {
      map['mode_id'] = Variable<int>(modeId.value);
    }
    if (statement.present) {
      map['statement'] = Variable<String>(statement.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhasesCompanion(')
          ..write('id: $id, ')
          ..write('modeId: $modeId, ')
          ..write('statement: $statement, ')
          ..write('number: $number')
          ..write(')'))
        .toString();
  }
}

class $PhasesTable extends Phases with TableInfo<$PhasesTable, Phase> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PhasesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _modeIdMeta = const VerificationMeta('modeId');
  late final GeneratedColumn<int?> modeId = GeneratedColumn<int?>(
      'mode_id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES modes(id)');
  final VerificationMeta _statementMeta = const VerificationMeta('statement');
  late final GeneratedColumn<String?> statement = GeneratedColumn<String?>(
      'statement', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _numberMeta = const VerificationMeta('number');
  late final GeneratedColumn<int?> number = GeneratedColumn<int?>(
      'number', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, modeId, statement, number];
  @override
  String get aliasedName => _alias ?? 'phases';
  @override
  String get actualTableName => 'phases';
  @override
  VerificationContext validateIntegrity(Insertable<Phase> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('mode_id')) {
      context.handle(_modeIdMeta,
          modeId.isAcceptableOrUnknown(data['mode_id']!, _modeIdMeta));
    } else if (isInserting) {
      context.missing(_modeIdMeta);
    }
    if (data.containsKey('statement')) {
      context.handle(_statementMeta,
          statement.isAcceptableOrUnknown(data['statement']!, _statementMeta));
    } else if (isInserting) {
      context.missing(_statementMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Phase map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Phase.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PhasesTable createAlias(String alias) {
    return $PhasesTable(_db, alias);
  }
}

class Scoreboard extends DataClass implements Insertable<Scoreboard> {
  final int id;
  final int modeId;
  final String title;
  final int round;
  final DateTime creationDate;
  Scoreboard(
      {required this.id,
      required this.modeId,
      required this.title,
      required this.round,
      required this.creationDate});
  factory Scoreboard.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Scoreboard(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      modeId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}mode_id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      round: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}round'])!,
      creationDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}creation_date'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['mode_id'] = Variable<int>(modeId);
    map['title'] = Variable<String>(title);
    map['round'] = Variable<int>(round);
    map['creation_date'] = Variable<DateTime>(creationDate);
    return map;
  }

  ScoreboardsCompanion toCompanion(bool nullToAbsent) {
    return ScoreboardsCompanion(
      id: Value(id),
      modeId: Value(modeId),
      title: Value(title),
      round: Value(round),
      creationDate: Value(creationDate),
    );
  }

  factory Scoreboard.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Scoreboard(
      id: serializer.fromJson<int>(json['id']),
      modeId: serializer.fromJson<int>(json['modeId']),
      title: serializer.fromJson<String>(json['title']),
      round: serializer.fromJson<int>(json['round']),
      creationDate: serializer.fromJson<DateTime>(json['creationDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'modeId': serializer.toJson<int>(modeId),
      'title': serializer.toJson<String>(title),
      'round': serializer.toJson<int>(round),
      'creationDate': serializer.toJson<DateTime>(creationDate),
    };
  }

  Scoreboard copyWith(
          {int? id,
          int? modeId,
          String? title,
          int? round,
          DateTime? creationDate}) =>
      Scoreboard(
        id: id ?? this.id,
        modeId: modeId ?? this.modeId,
        title: title ?? this.title,
        round: round ?? this.round,
        creationDate: creationDate ?? this.creationDate,
      );
  @override
  String toString() {
    return (StringBuffer('Scoreboard(')
          ..write('id: $id, ')
          ..write('modeId: $modeId, ')
          ..write('title: $title, ')
          ..write('round: $round, ')
          ..write('creationDate: $creationDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          modeId.hashCode,
          $mrjc(
              title.hashCode, $mrjc(round.hashCode, creationDate.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Scoreboard &&
          other.id == this.id &&
          other.modeId == this.modeId &&
          other.title == this.title &&
          other.round == this.round &&
          other.creationDate == this.creationDate);
}

class ScoreboardsCompanion extends UpdateCompanion<Scoreboard> {
  final Value<int> id;
  final Value<int> modeId;
  final Value<String> title;
  final Value<int> round;
  final Value<DateTime> creationDate;
  const ScoreboardsCompanion({
    this.id = const Value.absent(),
    this.modeId = const Value.absent(),
    this.title = const Value.absent(),
    this.round = const Value.absent(),
    this.creationDate = const Value.absent(),
  });
  ScoreboardsCompanion.insert({
    this.id = const Value.absent(),
    required int modeId,
    required String title,
    this.round = const Value.absent(),
    required DateTime creationDate,
  })  : modeId = Value(modeId),
        title = Value(title),
        creationDate = Value(creationDate);
  static Insertable<Scoreboard> custom({
    Expression<int>? id,
    Expression<int>? modeId,
    Expression<String>? title,
    Expression<int>? round,
    Expression<DateTime>? creationDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (modeId != null) 'mode_id': modeId,
      if (title != null) 'title': title,
      if (round != null) 'round': round,
      if (creationDate != null) 'creation_date': creationDate,
    });
  }

  ScoreboardsCompanion copyWith(
      {Value<int>? id,
      Value<int>? modeId,
      Value<String>? title,
      Value<int>? round,
      Value<DateTime>? creationDate}) {
    return ScoreboardsCompanion(
      id: id ?? this.id,
      modeId: modeId ?? this.modeId,
      title: title ?? this.title,
      round: round ?? this.round,
      creationDate: creationDate ?? this.creationDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (modeId.present) {
      map['mode_id'] = Variable<int>(modeId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (round.present) {
      map['round'] = Variable<int>(round.value);
    }
    if (creationDate.present) {
      map['creation_date'] = Variable<DateTime>(creationDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScoreboardsCompanion(')
          ..write('id: $id, ')
          ..write('modeId: $modeId, ')
          ..write('title: $title, ')
          ..write('round: $round, ')
          ..write('creationDate: $creationDate')
          ..write(')'))
        .toString();
  }
}

class $ScoreboardsTable extends Scoreboards
    with TableInfo<$ScoreboardsTable, Scoreboard> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ScoreboardsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _modeIdMeta = const VerificationMeta('modeId');
  late final GeneratedColumn<int?> modeId = GeneratedColumn<int?>(
      'mode_id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES modes(id)');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _roundMeta = const VerificationMeta('round');
  late final GeneratedColumn<int?> round = GeneratedColumn<int?>(
      'round', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultValue: Constant(1));
  final VerificationMeta _creationDateMeta =
      const VerificationMeta('creationDate');
  late final GeneratedColumn<DateTime?> creationDate =
      GeneratedColumn<DateTime?>('creation_date', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, modeId, title, round, creationDate];
  @override
  String get aliasedName => _alias ?? 'scoreboards';
  @override
  String get actualTableName => 'scoreboards';
  @override
  VerificationContext validateIntegrity(Insertable<Scoreboard> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('mode_id')) {
      context.handle(_modeIdMeta,
          modeId.isAcceptableOrUnknown(data['mode_id']!, _modeIdMeta));
    } else if (isInserting) {
      context.missing(_modeIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('round')) {
      context.handle(
          _roundMeta, round.isAcceptableOrUnknown(data['round']!, _roundMeta));
    }
    if (data.containsKey('creation_date')) {
      context.handle(
          _creationDateMeta,
          creationDate.isAcceptableOrUnknown(
              data['creation_date']!, _creationDateMeta));
    } else if (isInserting) {
      context.missing(_creationDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Scoreboard map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Scoreboard.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ScoreboardsTable createAlias(String alias) {
    return $ScoreboardsTable(_db, alias);
  }
}

class Player extends DataClass implements Insertable<Player> {
  final int id;
  final String name;
  final int boardId;
  final int phaseId;
  Player(
      {required this.id,
      required this.name,
      required this.boardId,
      required this.phaseId});
  factory Player.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Player(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      boardId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}board_id'])!,
      phaseId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phase_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['board_id'] = Variable<int>(boardId);
    map['phase_id'] = Variable<int>(phaseId);
    return map;
  }

  PlayersCompanion toCompanion(bool nullToAbsent) {
    return PlayersCompanion(
      id: Value(id),
      name: Value(name),
      boardId: Value(boardId),
      phaseId: Value(phaseId),
    );
  }

  factory Player.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Player(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      boardId: serializer.fromJson<int>(json['boardId']),
      phaseId: serializer.fromJson<int>(json['phaseId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'boardId': serializer.toJson<int>(boardId),
      'phaseId': serializer.toJson<int>(phaseId),
    };
  }

  Player copyWith({int? id, String? name, int? boardId, int? phaseId}) =>
      Player(
        id: id ?? this.id,
        name: name ?? this.name,
        boardId: boardId ?? this.boardId,
        phaseId: phaseId ?? this.phaseId,
      );
  @override
  String toString() {
    return (StringBuffer('Player(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('boardId: $boardId, ')
          ..write('phaseId: $phaseId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(name.hashCode, $mrjc(boardId.hashCode, phaseId.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Player &&
          other.id == this.id &&
          other.name == this.name &&
          other.boardId == this.boardId &&
          other.phaseId == this.phaseId);
}

class PlayersCompanion extends UpdateCompanion<Player> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> boardId;
  final Value<int> phaseId;
  const PlayersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.boardId = const Value.absent(),
    this.phaseId = const Value.absent(),
  });
  PlayersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int boardId,
    required int phaseId,
  })  : name = Value(name),
        boardId = Value(boardId),
        phaseId = Value(phaseId);
  static Insertable<Player> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? boardId,
    Expression<int>? phaseId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (boardId != null) 'board_id': boardId,
      if (phaseId != null) 'phase_id': phaseId,
    });
  }

  PlayersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? boardId,
      Value<int>? phaseId}) {
    return PlayersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      boardId: boardId ?? this.boardId,
      phaseId: phaseId ?? this.phaseId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (boardId.present) {
      map['board_id'] = Variable<int>(boardId.value);
    }
    if (phaseId.present) {
      map['phase_id'] = Variable<int>(phaseId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('boardId: $boardId, ')
          ..write('phaseId: $phaseId')
          ..write(')'))
        .toString();
  }
}

class $PlayersTable extends Players with TableInfo<$PlayersTable, Player> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PlayersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _boardIdMeta = const VerificationMeta('boardId');
  late final GeneratedColumn<int?> boardId = GeneratedColumn<int?>(
      'board_id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES scoreboards(id)');
  final VerificationMeta _phaseIdMeta = const VerificationMeta('phaseId');
  late final GeneratedColumn<int?> phaseId = GeneratedColumn<int?>(
      'phase_id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES phases(id)');
  @override
  List<GeneratedColumn> get $columns => [id, name, boardId, phaseId];
  @override
  String get aliasedName => _alias ?? 'players';
  @override
  String get actualTableName => 'players';
  @override
  VerificationContext validateIntegrity(Insertable<Player> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('board_id')) {
      context.handle(_boardIdMeta,
          boardId.isAcceptableOrUnknown(data['board_id']!, _boardIdMeta));
    } else if (isInserting) {
      context.missing(_boardIdMeta);
    }
    if (data.containsKey('phase_id')) {
      context.handle(_phaseIdMeta,
          phaseId.isAcceptableOrUnknown(data['phase_id']!, _phaseIdMeta));
    } else if (isInserting) {
      context.missing(_phaseIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Player map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Player.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PlayersTable createAlias(String alias) {
    return $PlayersTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ModesTable modes = $ModesTable(this);
  late final $PhasesTable phases = $PhasesTable(this);
  late final $ScoreboardsTable scoreboards = $ScoreboardsTable(this);
  late final $PlayersTable players = $PlayersTable(this);
  late final ModesDao modesDao = ModesDao(this as AppDatabase);
  late final PhasesDao phasesDao = PhasesDao(this as AppDatabase);
  late final ScoreboardsDao scoreboardsDao =
      ScoreboardsDao(this as AppDatabase);
  late final PlayersDao playersDao = PlayersDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [modes, phases, scoreboards, players];
}
