import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {

  static Database? _db;

  Future<Database?> get db async {
    if(_db == null){
      _db = await initialDb();
      return _db;
    }
    else {
      return _db;
    }
  }

  Future<Database> initialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'medo.db');
    Database myDb = await openDatabase(path, onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return myDb;
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion){
    print("--------------- DATABASE UPGRADED ---------------");
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE "notes" (
          "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          "note" TEXT NOT NULL
        )
    ''');
    print("--------------- DATABASE CREATED ---------------");
  }

  Future<List<Map>> readData(String sql) async {
    Database? mydb = await db;
    List<Map <String, Object?>> response = await mydb!.rawQuery(sql);
    return response;
  }

  Future<int> insertData(String sql) async {
    Database? mydb = await db;

    int? response;
    await mydb?.transaction ((txn) async {
      response = await txn.rawInsert(sql);
      return null;
    });

    return response!;
  }


  Future<int> updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }


  Future<int> deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

}