import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testaapril/Data%20Layer/Model/Admin%20Model.dart';

import '../Model/User Model.dart';



class Db {
  Db._privateContructor();

  static final Db instance = Db._privateContructor();

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
        ' CREATE TABLE User(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,age INTEGER) '
        ' ');

    await db.execute(' '
        ' CREATE TABLE Admin(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,age INTEGER) '
        ' ');
  }

  //add User data
  Future<int> addUser(UserModel userModel) async
  {
    Database db = await instance.database;
    return await db.insert('User',userModel.toJson());
  }

  //add Admin data
  Future<int> addAdmin(AdminModel adminModel) async
  {
    Database db = await instance.database;
    return await db.insert('Admin',adminModel.toJson());
  }


  //get all User data
  Future<List<UserModel>> getAllUserData() async {
    Database db = await instance.database;
    final userModel = await db.query('User', orderBy: 'name');
    return userModel.map((json) => UserModel.fromJson(json)).toList();
  }

  //get all Admin data
  Future<List<AdminModel>> getAllAdminData() async {
    Database db = await instance.database;
    final adminModel = await db.query('Admin', orderBy: 'name');
    return adminModel.map((json) => AdminModel.fromJson(json)).toList();
  }

  //get specific user data
  Future<UserModel> getSpecificUserData(int id) async {
    Database db = await instance.database;
    final userData = await db.query('User',
        columns: ['id', 'name', 'age'], where: 'id = ?', whereArgs: [id]);

    if (userData.isNotEmpty) {
      return UserModel.fromJson(userData.first);
    }

    throw Exception('ID not found');
  }

  //get specific admin data
  Future<AdminModel> getSpecificAdminData(int id) async {
    Database db = await instance.database;
    final adminData = await db.query('Admin',
        columns: ['id', 'name', 'age'], where: 'id = ?', whereArgs: [id]);

    if (adminData.isNotEmpty) {
      return AdminModel.fromJson(adminData.first);
    }

    throw Exception('ID not found');
  }

  //update User Data
  Future<int> updateUser(UserModel userModel) async {
    Database db = await instance.database;

    return db.update(
      'User',
      userModel.toJson(),
      where: 'id = ?',
      whereArgs: [userModel.id],
    );
  }

  //update Admin Data
  Future<int> updateAdmin(AdminModel adminModel) async {
    Database db = await instance.database;

    return db.update(
      'Admin',
      adminModel.toJson(),
      where: 'id = ?',
      whereArgs: [adminModel.id],
    );
  }

  //delete User Data
  Future<int> deleteUser(int id) async {
    Database db = await instance.database;

    return db.delete(
      'User',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //delete Admin Data
  Future<int> deleteAdmin(int id) async {
    Database db = await instance.database;

    return db.delete(
      'Admin',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
