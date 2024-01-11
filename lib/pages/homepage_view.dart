import 'package:flutter/material.dart';
import 'package:flutter_sqlite/controller/homepage_cotroller.dart';
import 'package:flutter_sqlite/models/user_model.dart';
import 'package:flutter_sqlite/pages/add_data_view.dart';
import 'package:flutter_sqlite/pages/edit_data_view.dart';
import 'package:get/get.dart';

class HomePageView extends StatelessWidget {
   HomePageView({super.key});
  final controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter sqflite CRUD"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<UserModel>> (
        future: controller.getDataUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                UserModel user = snapshot.data![index];
                return ListTile(
                  title: Text(user.name! ?? ""),
                  subtitle: Text(user.email! ?? ""),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                            print(user.name!);
                            Get.to(EditDataView(), arguments: [
                              user.id,
                              user.name,
                              user.email!
                            ]);
                        },
                        icon: Icon(Icons.edit)
                      ),
                      IconButton(
                        onPressed: () {
                          controller.deleteDataUser(user.id!);
                          Get.offAll(HomePageView());
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text("No data"),
              );
          }
        },
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
            onPressed: () {
              Get.to(FormDataView());
            },
            child: Icon(Icons.add)),
        )
      );
  }
}