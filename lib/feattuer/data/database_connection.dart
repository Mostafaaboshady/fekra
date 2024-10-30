import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class DatabaseConnection {
  Database? database;

  Future<Database?> createDatabase() async {
    if (database != null) return database;

    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'tasks.db');
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, status TEXT, date TEXT)');
        });
    return database;
  }

  Future<void> insertData(
      String title, String description, String status, String date) async {
    final db = await createDatabase();
    await db?.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO tasks(title, description, status, date) VALUES(?, ?, ?, ?)',
          [title, description, status, date]);
    });
  }

  Future<List<Map>> readData() async {
    final db = await createDatabase();
    return await db!.query('tasks');
  }

  Future<void> deleteData(int id) async {
    final db = await createDatabase();
    await db!.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
