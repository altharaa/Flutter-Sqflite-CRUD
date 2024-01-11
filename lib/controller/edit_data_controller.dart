import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sqlite/models/user_model.dart';
import 'package:flutter_sqlite/pages/homepage_view.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class EditDataController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  Database? database;

  var data = [].obs;

  void insert() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "db_user";
    database = await openDatabase(path);
    List<dynamic> userData = data.value;

    UserModel user = UserModel(
      id: userData[0],
      name: nameController.text,
      email: emailController.text,
    );

    await database!
        .update('user', user.toJson(), where: 'id = ?', whereArgs: [user.id]);
    Get.offAll(HomePageView());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    List<dynamic> userData = data.value;
    nameController.text = userData[1];
    emailController.text = userData[2];
    super.onReady();
  }
}