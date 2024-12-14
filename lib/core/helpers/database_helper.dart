import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:developer';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._privateConstructor();
  static Database? _database;
  final String _databaseName = 'moments.db';
  final int _databaseVersion = 1;

  // Variabel untuk akses table
  static const String tableMoments = 'moments';
  static const String tableComments = 'comments';

  DatabaseHelper._privateConstructor();
  // Constructor
  factory DatabaseHelper() {
    return _instance;
  }
  // Getter untuk akses database
  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  // Method untuk inisialisasi database
  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/$_databaseName';
    return openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await _newInVersion1(db);
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {}

  // Table baru di versi 1
  Future<void> _newInVersion1(Database db) async {
    try {
      await db.execute('''
        CREATE TABLE $tableMoments (
          id TEXT PRIMARY KEY,
          creator TEXT,
          location TEXT,
          momentDate TEXT,
          caption TEXT,
          imageUrl TEXT,
          likesCount INTEGER,
          commentsCount INTEGER,
          bookmarksCount INTEGER
        )
      ''');

      await db.execute('''
        CREATE TABLE $tableComments (
          id TEXT PRIMARY KEY,
          momentId TEXT,
          creator TEXT,
          content TEXT, 
          createdAt TEXT
        )
      ''');
    } catch (e) {
      log(e.toString(), name: "DatabaseHelper:_newInVersion1");
    }
  }
}
