import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  static Database? _database;

  factory DatabaseService() => _instance;

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = '${await getDatabasesPath()}flutter_task.db';
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future<void> _createDb(Database db, int version) async {
    // Create tables
    await db.execute('''
      CREATE TABLE categories(
        id Real PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        image TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE products(
        id Real PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        price REAL NOT NULL,
        oldPrice REAL NOT NULL,
        soldNumber Real NOT NULL,
        categoryId Real,
        FOREIGN KEY (categoryId) REFERENCES categories (id) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE bundles(
        id Real PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        price TEXT NOT NULL,
        views Real  NULL,
        highlight TEXT,
        isSelected Real NOT NULL DEFAULT 0
      )
    ''');

    await db.execute('''
      CREATE TABLE features(
        id Real PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        note TEXT,
        icon Real NOT NULL,
        bundleId Real,
        FOREIGN KEY (bundleId) REFERENCES bundles (id) ON DELETE CASCADE
      )
    ''');
  }

  //delete db
  Future<void> deleteDb() async {
    await deleteDatabase('${await getDatabasesPath()}flutter_task.db');
  }
}
