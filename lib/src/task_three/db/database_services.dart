import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static Database? _db;
  static Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  static Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), "notes.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE notes(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          body TEXT,
          updatedAt TEXT,
          isSynced INTEGER
        )
        ''');
      },
    );
  }

  static Future<int> createNote(Map<String, dynamic> data) async {
    final dbClient = await db;
    return await dbClient.insert('notes', data);
  }

  static Future<List<Map<String, dynamic>>> getNotes() async {
    final dbClient = await db;
    return await dbClient.query('notes', orderBy: "updatedAt DESC");
  }

  static Future<int> updateNote(int id, Map<String, dynamic> data) async {
    final dbClient = await db;
    return await dbClient.update(
      'notes',
      data,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  static Future<int> deleteNote(int id) async {
    final dbClient = await db;
    return await dbClient.delete('notes', where: "id = ?", whereArgs: [id]);
  }
}
