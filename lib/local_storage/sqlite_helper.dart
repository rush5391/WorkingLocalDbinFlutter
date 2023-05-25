import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqliteHelper {
  SqliteHelper._();

  factory SqliteHelper() =>_instance;
  static final SqliteHelper _instance = new SqliteHelper._();
  static final SqliteHelper db = SqliteHelper._();
  static Database? _database;

  Future<Database> get
  database async

  {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  SqliteHelper.internal();

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "mock.db");
    return await openDatabase(path, version:1, onOpen:(db) {},
        onCreate:(Database db,int version)async {
          await db.execute("CREATE TABLE register("
              "id INTEGER PRIMARY KEY,"
              "full_name TEXT,"
              "phone_no TEXT,"
              "address TEXT,"
              "user_name TEXT,"
              "password TEXT,"
              "is_logging INTEGER"
              ")");
        });
  }
}