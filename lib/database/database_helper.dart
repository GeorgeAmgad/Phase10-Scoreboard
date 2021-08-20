import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:phase_10_score_tracker/database/constants_setters.dart';
import 'package:phase_10_score_tracker/model/phase.dart';
import 'package:phase_10_score_tracker/model/player.dart';
import 'package:sqflite/sqflite.dart';

import '../model/mode.dart';
import '../model/scoreboard.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory docsDirectory = await getApplicationDocumentsDirectory();
    String path = join(docsDirectory.path, 'scoreboards.db');
    // FOR DEVELOPMENT AND TESTING
    await deleteDatabase(path);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('PRAGMA foreign_keys = ON');
    final idType = 'INTEGER PRIMARY KEY';
    final textType = 'TEXT NOT NULL';
    final intType = 'INTEGER NOT NULL';

    await db.execute('''
      CREATE TABLE $modesTable (
        ${ModeFields.id} $idType,
        ${ModeFields.name} $textType UNIQUE
       )
    ''');

    await db.execute('''
      CREATE TABLE $phasesTable (
        ${PhaseFields.id} $idType,
        ${PhaseFields.modeId} $intType,
        ${PhaseFields.number} $intType,
        ${PhaseFields.statement} $textType,
        FOREIGN KEY (${PhaseFields.modeId}) REFERENCES $modesTable(${ModeFields.id})
        )
        ''');

    await db.execute('''
    CREATE TABLE $boardsTable (
      ${BoardFields.id} $idType,
      ${BoardFields.title} $textType,
      ${BoardFields.modeId} $intType,
      FOREIGN KEY (${BoardFields.modeId}) REFERENCES $modesTable(${ModeFields.id})
      )
    ''');

    await db.execute('''
    CREATE TABLE $playersTable (
      ${PlayerFields.id} $idType,
      ${PlayerFields.name} $textType,
      ${PlayerFields.boardId} $intType,
      ${PlayerFields.phaseId} $intType,
      FOREIGN KEY (${PlayerFields.boardId})
      REFERENCES $boardsTable(${BoardFields.id})
      )
    ''');

    await addModesAndPhases(db, version);
  }



}
