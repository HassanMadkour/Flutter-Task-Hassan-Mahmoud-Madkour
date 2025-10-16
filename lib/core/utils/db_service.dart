import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  static Database? _database;

  DatabaseService._internal() {
    // Initialize FFI for non-web platforms
    if (!_isWeb) {
      sqfliteFfiInit();
    }
  }

  bool get _isWeb => identical(0, 0.0); // Check if running on web

  factory DatabaseService() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databaseFactory = databaseFactoryFfi;

    final path = p.join(await _getDatabasePath(), 'the_database.db');

    return await databaseFactory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: _createDb,
        onUpgrade: _onUpgrade,
      ),
    );
  }

  Future<String> _getDatabasePath() async {
    // For mobile/desktop, use documents directory
    final documentsDirectory = await getApplicationDocumentsDirectory();
    return documentsDirectory.path;
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {}
  }

  Future<void> close() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }

  /// Deletes the database file and reinitializes it
  Future<void> resetDatabase() async {
    // Close and null out the database first
    if (_database != null) {
      await _database!.close();
      _database = null;
    }

    // Add a small delay to ensure the database is fully closed
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final dbPath = await _getDatabasePath();
      final dbFile = p.join(dbPath, 'the_database.db');

      // Try to delete the file if it exists
      final file = File(dbFile);
      if (await file.exists()) {
        try {
          await file.delete();
        } catch (e) {
          print('Warning: Could not delete database file: $e');
          // Try renaming the file as a fallback
          final backupPath =
              '${dbFile}_backup_${DateTime.now().millisecondsSinceEpoch}';
          await file.rename(backupPath);
          print('Renamed old database to: $backupPath');
        }
      }

      // Reinitialize the database
      _database = await _initDatabase();
    } catch (e) {
      print('Error resetting database: $e');
      rethrow;
    }
  }

  Future<void> _createDb(Database db, int version) async {
    // Create tables
    await db.execute('''
      CREATE TABLE categories(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        image TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE products(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        price REAL NOT NULL,
        oldPrice REAL NOT NULL,
        soldNumber INTEGER NOT NULL,
        image TEXT NOT NULL,
        categoryId INTEGER,
        FOREIGN KEY (categoryId) REFERENCES categories (id) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE bundles(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        price TEXT NOT NULL,
        views INTEGER  NULL,
        highlight TEXT  NULL,
        isSelected INTEGER DEFAULT 0
      )
    ''');

    await db.execute('''
      CREATE TABLE features(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        note TEXT NULL,
        icon INTEGER NOT NULL
      )
    ''');
    //bundleFeature
    await db.execute('''
      CREATE TABLE bundleFeature(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        bundleId INTEGER,
        featureId INTEGER,
        FOREIGN KEY (bundleId) REFERENCES bundles (id) ,
        FOREIGN KEY (featureId) REFERENCES features (id) 
      )
    ''');
    await db.execute('''
      insert into categories(name, image) values('موضة رجالى', 'assets/images/categories/image2.png'),
      ('ساعات', 'assets/images/categories/image1.png'),
      ('موبايلات', 'assets/images/categories/image3.png'),
      ('منتجات تجميل', 'assets/images/categories/image4.png'),
      ('فلل', 'assets/images/categories/image5.png')
      ''');

    await db.execute('''
      insert into  products(name,price,oldPrice,soldNumber,image,categoryId) values
      ('جاكيت من الصوف مناسب', 32000000, 600000000, 3300, 'assets/images/products/Picture.png', 1),
      ('جاكيت من الصوف مناسب', 32000000, 600000000, 3300, 'assets/images/products/Picture2.png', 1),
      ('جاكيت من الصوف مناسب', 32000000, 600000000, 3300, 'assets/images/products/Picture3.png', 1),
      ('جاكيت من الصوف مناسب', 32000000, 600000000, 3300, 'assets/images/products/Picture.png', 1),
      ('جاكيت من الصوف مناسب', 32000000, 600000000, 3300, 'assets/images/products/Picture3.png', 1),
      ('جاكيت من الصوف مناسب', 32000000, 600000000, 3300, 'assets/images/products/Picture.png', 1),
      ('جاكيت من الصوف مناسب', 32000000, 600000000, 3300, 'assets/images/products/Picture3.png', 1)
      ''');
    //

    await db.execute('''
      insert into  bundles(name,price,views,highlight , isSelected) values
      ('الاساسية', 3000, null, null , 0),
      ('اكسترا', 3000 , 7 , null , 1),
      ('بلس', 3000 , 18 , 'افضل قيمة مقابل سعر' , 1),
      ('سوبر', 3000 , 24 , 'اعلي نشاهدات' , 0)
      ''');

    await db.execute('''
      insert into features(name,note,icon) values
      ('صلاحية الأعلان 30 يوم', null, 0 ),
      ('رفع لأعلى القائمة كل 2 يوم', null, 1),
      ('تثبيت فى مقاول صحى' , ' خلال ال48 ساعة القادم', 2),
      ('ظهور فى كل محافظات مصر', null, 3),
      ('أعلان مميز', null, 4),
      ('تثبيت فى مقاول صحى فى الجهراء', null, 2),
            ('تثبيت فى مقاول صحى' , ' خلال ال48 ساعة القادم', 2)

      ''');

    await db.execute('''
        insert into bundleFeature(bundleId,featureId) values
        (1,1),
        (2,1),
        (2,2),
        (2,3),
        (3,1),
        (3,2),
        (3,3),
        (3,4),
        (3,5),
        (3,6),
        (3,7),
        (4,1),
        (4,2),
        (4,3),
        (4,4),
        (4,5),
        (4,6),
        (4,7)
''');
  }
}
