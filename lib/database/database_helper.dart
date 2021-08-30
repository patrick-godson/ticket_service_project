import 'dart:io';

import 'package:first_app/database/models/request_model.dart';
import 'package:first_app/database/models/setting_model.dart';
import 'package:first_app/database/models/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'ticket_service.db');
    // await deleteDatabase(path);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          userName TEXT,
          name TEXT,
          email TEXT,
          password TEXT
      )
      ''');

    await db.execute("""
      CREATE TABLE requests(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        level TEXT,
        fullName TEXT,
        phone TEXT,
        type TEXT,
        description TEXT,
        file TEXT,
        creation_date TEXT
      )
    """);

    await db.execute("""
      CREATE TABLE setting(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        link TEXT
      )
    """);
  }

  //USER FUNCTIONS RELATED TO DATABASE
  //User - insert
  Future<int> insertUser(User user) async {
    Database db = await database;
    return await db.insert("users", user.toMap());
  }

  //User - retrieve all
  Future<List<User>> fetchUsers() async {
    Database db = await database;
    List<Map> users = await db.query("users");
    return users.length == 0 ? [] : users.map((x) => User.fromMap(x)).toList();
  }

  //REQUEST FUNCTIONS RELATED TO DATABASE
  //Request - insert
  Future<int> insertRequest(Request request) async {
    Database db = await database;
    return await db.insert("requests", request.toMap());
  }

  //Request - retrieve all
  Future<List<Request>> fetchRequests() async {
    Database db = await database;
    List<Map> requests = await db.query("requests");
    return requests.length == 0
        ? []
        : requests.map((x) => Request.fromMap(x)).toList();
  }

  //User - delete
  Future<int> deleteRequest(int id) async {
    Database db = await database;
    return await db.delete("requests", where: 'id = ?', whereArgs: [id]);
  }

  //TECHNICIAN FUNCTIONS RELATED TO DATABASE
  //Request - retrieve all
  Future<List<Setting>> fetchSetting() async {
    Database db = await database;
    List<Map> setting = await db.query("setting");
    return setting.length == 0
        ? []
        : setting.map((x) => Setting.fromMap(x)).toList();
  }

  Future<int> deleteSetting(int id) async {
    Database db = await database;
    return await db.delete("setting", where: 'id = ?', whereArgs: [id]);
  }

  Future<int> insertSetting(Setting setting) async {
    Database db = await database;
    return await db.insert("setting", setting.toMap());
  }
}
