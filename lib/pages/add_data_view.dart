import 'package:flutter/material.dart';
import 'package:flutter_sqlite/controller/add_data_controller.dart';
import 'package:get/get.dart';

class FormDataView extends StatelessWidget {
  FormDataView({super.key});
  final controller = Get.put(FormAddDataController());

  @override
  Widget build(BuildContext context) {
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
          title: Text("Create Data"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            textInput("Nama", "Masukkan Nama", controller.nameController),
            textInput("Email", "Masukkan Email", controller.emailController),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.addUser();
                },
                child: Text("Simpan data"))
          ],
        )
    );
  }
}
