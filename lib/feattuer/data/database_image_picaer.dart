import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseImagePicker {
  Database? database;

  Future<Database?> createDatabase() async {
    if (database != null) return database;

    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'images.db'); // اسم قاعدة البيانات
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE images(id INTEGER PRIMARY KEY AUTOINCREMENT, image_path TEXT)');
        });
    return database;
  }

  Future<void> insertImage(String imagePath) async {
    final db = await createDatabase();
    await deleteImage(); // حذف البيانات السابقة قبل الإدخال
    await db?.insert('images', {'image_path': imagePath}); // إدخال المسار
  }

  Future<List<Map>> readData() async {
    final db = await createDatabase();
    return await db!.query('images'); // قراءة البيانات
  }

  Future<void> deleteImage() async {
    final db = await createDatabase();
    await db!.delete('images'); // حذف البيانات
  }
}
