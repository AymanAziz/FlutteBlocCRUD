import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../Model/aprilModel.dart';

class aprilDatabase {
  aprilDatabase._privateContructor();

  static final aprilDatabase instance = aprilDatabase._privateContructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    //directory ==> provide support for directory
    //getApplicationDocumentsDirectory() --> support document directory
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, 'Database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  //create database
  Future _onCreate(Database db, int version) async {
    await db.execute(' '
        ' CREATE TABLE April(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,day INTEGER) '
        ' ');
  }

  //add april data
  Future<int> add(AprilModel aprilModel) async
  {
    Database db = await instance.database;
    return await db.insert('April',aprilModel.toJson());
  }

  //get all data
  Future<List<AprilModel>> getAllAprilData() async {
    Database db = await instance.database;
    final aprildata = await db.query('April', orderBy: 'name');

    return aprildata.map((json) => AprilModel.fromJson(json)).toList();
  }

  //get specific data
  Future<AprilModel> getSpecificAprilData(int id) async {
    Database db = await instance.database;
    final aprildata = await db.query('April',
        columns: ['id', 'name', 'day'], where: 'id = ?', whereArgs: [id]);

    if (aprildata.isNotEmpty) {
      return AprilModel.fromJson(aprildata.first);
    }

    throw Exception('ID not found');
  }
}
