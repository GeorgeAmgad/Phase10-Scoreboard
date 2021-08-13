import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'model/mode.dart';
import 'model/scoreboard.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory docsDirectory = await getApplicationDocumentsDirectory();
    String path = join(docsDirectory.path, 'scoreboards.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('PRAGMA foreign_keys = ON');
    final idType = 'INTEGER';
    final textType = 'TEXT NOT NULL';
    final intType = 'INTEGER NOT NULL';

    await db.execute('''
      CREATE TABLE $modeTable (
        ${ModeFields.id} $idType,
        ${ModeFields.name} $textType,
        PRIMARY KEY (${ModeFields.id}, ${ModeFields.name})
       )
    ''');

    await db.execute('''CREATE TABLE $boardTable (
      ${BoardFields.id} $idType,
      ${BoardFields.name} $textType,
      ${BoardFields.mode} $intType,
      PRIMARY KEY (${BoardFields.id}, ${BoardFields.name}),
      FOREIGN KEY (${BoardFields.mode}) REFERENCES $modeTable(${ModeFields.id})
      )
    ''');
  }

  Future<List<Mode>> getModes() async {
    Database db = await instance.database;
    var modes = await db.query('$modeTable');
    print(modes);
    List<Mode> modesList =
        modes.isNotEmpty ? modes.map((e) => Mode.fromJson(e)).toList() : [];
    print(modesList);
    return modesList;
  }

  Future<int> addMode(Mode mode) async {
    Database db = await instance.database;
    return await db.insert('$modeTable', mode.toJson());
  }
  
  // Future<int> addScoreboard(Scoreboard sb) async {
  //   Database db = await instance.database;
  //   // return await db.rawInsert(sql)
  // }
}
