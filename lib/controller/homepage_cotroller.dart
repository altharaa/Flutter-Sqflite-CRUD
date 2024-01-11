import 'dart:io';

import 'package:flutter_sqlite/models/user_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class HomePageController extends GetxController {

  @override
  void onInit() {
    initDatabase();
    super.onInit();
  }

  Database? database;

  void initDatabase() async {
    String db_name = "db_user";
    int db_version = 1;
    String table = "user";

    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + db_name;

    if (database == null) {
      database = await openDatabase(path, version: db_version,
          onCreate: (db, version) {
        db.execute('''
          CREATE TABLE $table (
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            name VARCHAR(255), email VARCHAR, 
            password VARCHAR)
          ''');
      });
    } else {

    }
  }

  Future<List<UserModel>> getDataUser() async {
    String table = "user";
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "db_user";
    database = await openDatabase(path);
    final data = await database!.query(table);
    List<UserModel> user = data.map((e) => UserModel.fromJson(e)).toList();
    return user;
  }

  Future<void> deleteDataUser(int id) async {
    String table = 'user';
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "db_user";
    database = await openDatabase(path);

    await database!.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
