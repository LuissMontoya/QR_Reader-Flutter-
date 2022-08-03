import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();
/*
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }*/

  Future<Database> get database async {
    return _database ??= await initDB();
  }

  Future<Database> initDB() async {
    //Path donde se va a almacenar
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    // 123123123123-123123123423423-/documents
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);

    //crear la bd
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
      CREATE TABLE Scans(
        id INTEGER PRIMARY KEY,
        tipo TEXT,
        valor TEXT
      )
      ''');
      },
    );
  }
}
