import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class historyDatabase {
  static final historyDatabase _instance = historyDatabase._internal();

  factory historyDatabase() => _instance;

  historyDatabase._internal();

  late final Database database;

  _onCreate(Database db, int version) async{
    await db.execute('Create Table entry (id INTEGER PRIMARY KEY AUTOINCREMENT), name TEXT, date INTEGER)');
  }

  open() async{
    database = await  openDatabase(join(await getDatabasesPath(),'history.db'),
        version: 1,
        onCreate: _onCreate);
  }
}

