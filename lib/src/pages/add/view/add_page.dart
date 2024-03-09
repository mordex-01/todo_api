import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_api/src/pages/add/controller/add_controller.dart';

class AddPage extends GetView<AddController> {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 33, 36),
      appBar: AppBar(
        title: const Text("My Add Page"),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 38, 38, 38),
        leading: IconButton(
            onPressed: () {
              controller.getBack();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      body: Column(
        children: [
          _titleTextField(
              hintText: "Enter id",
              maxLines: 1,
              controller: controller.userIdController),
          _titleTextField(
              hintText: "Enter Title",
              maxLines: 1,
              controller: controller.titleController),
          _titleTextField(
              hintText: "Enter Description",
              maxLines: 24,
              controller: controller.descriptionController),
          _addButton(onPressed: () => controller.addTodo()),
        ],
      ),
    );
  }

  Widget _titleTextField({
    required String? hintText,
    required int? maxLines,
    required TextEditingController? controller,
  }) =>
      Padding(
        padding: const EdgeInsets.all(8),
        child: TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            fillColor: const Color.fromARGB(255, 96, 99, 104),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white),
          ),
        ),
      );
  Widget _addButton({required void Function()? onPressed}) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: RawMaterialButton(
            onPressed: onPressed,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color.fromARGB(255, 234, 128, 252),
              ),
              child: const Center(
                child: Text(
                  "Add",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ),
        ),
      );
}
