import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_api/src/pages/edit/controller/edit_controller.dart';

class EditPage extends GetView<EditController> {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 33, 36),
      appBar: AppBar(
        title: const Text("My Edit Page"),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 38, 38, 38),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleTextField(
              hintText: "Enter id",
              maxLines: 1,
              controller: controller.userIdController),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: _titleTextField(
                    hintText: "Enter Title",
                    maxLines: 1,
                    controller: controller.titleController),
              ),
              Obx(
                () => Expanded(
                  flex: 1,
                  child: _checkBox(
                    valueBool: controller.isChecked,
                    onPressed: () {
                      controller.onCheckBoxTapped();
                    },
                  ),
                ),
              )
            ],
          ),
          _titleTextField(
              hintText: "Enter Description",
              maxLines: 24,
              controller: controller.descriptionController),
          _addButton(onPressed: () {
            controller.onEditTodo();
          }),
        ],
      ),
    );
  }

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
                  "Edit",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ),
        ),
      );
  Widget _checkBox(
          {required Rx<bool> valueBool, required void Function()? onPressed}) =>
      Container(
          width: 52,
          height: 52,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: IconButton(
              onPressed: onPressed,
              icon: controller.isChecked.value
                  ? Icon(Icons.check_box_outlined)
                  : Icon(Icons.check_box_outline_blank_rounded)));
  Widget _titleTextField(
          {required String? hintText,
          required int? maxLines,
          required TextEditingController? controller}) =>
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
}
