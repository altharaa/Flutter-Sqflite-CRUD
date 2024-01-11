import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sqlite/models/user_model.dart';
import 'package:flutter_sqlite/pages/homepage_view.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class FormAddDataController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Database? database;

  void addUser() async {
    String table = "user";
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "db_user";
    database = await openDatabase(path);

    UserModel user = UserModel(
      name: nameController.text,
      email: emailController.text,
    );

    await database!.insert(table, user.toJson());
    Get.offAll(HomePageView());
  }

  // @override
  // void onClose() {
  //   nameController.dispose();
  //   emailController.dispose();
  //   super.onClose();
  // }
}
