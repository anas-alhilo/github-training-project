import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbController {
  DbController._();

  static DbController? _instance;

  late Database _database;

  factory DbController() {
    return _instance ??= DbController._();
  }

  Database get database => _database;

  Future<void> initDatabase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, 'app_db.sql');
    _database = await openDatabase(
      path,
      version: 1,
      onOpen: (Database database) {},
      onCreate: (Database database, int version) {
        database.execute(
          'CREATE TABLE users ('
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'
          'lname TEXT NOT NULL,'
          'fname TEXT NOT NULL,'
          'email TEXT NOT NULL,'
          'password TEXT NOT NULL'
          ')',
        );
      },
    );
  }
}
