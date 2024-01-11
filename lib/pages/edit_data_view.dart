import 'package:flutter/material.dart';
import 'package:flutter_sqlite/controller/edit_data_controller.dart';
import 'package:get/get.dart';

class EditDataView extends StatelessWidget {
  EditDataView({super.key});
  final controller = Get.put(EditDataController());

  @override
  Widget build(BuildContext context) {
    controller.data.value = Get.arguments;

    Widget textInput(String label, String hint,
        TextEditingController textEditingController) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
          title: Text("Edit Data"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            textInput("Nama", "Masukkan Nama", controller.nameController),
            textInput(
                "Email", "Masukkan Email", controller.emailController),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.insert();
                },
                child: Text("Simpan data"))
          ],
        )
    );
  }
}