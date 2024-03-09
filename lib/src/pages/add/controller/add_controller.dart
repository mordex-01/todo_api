import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_api/src/pages/add/model/add_dto.dart';
import 'package:todo_api/src/pages/add/repository/add_repository.dart';

class AddController extends GetxController {
  @override
  void onClose() {
    super.onClose();
    userIdController.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  final AddRepository _repository = AddRepository();
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<void> addTodo() async {
    final dto = AddDto(
        userId: userIdController.text,
        title: titleController.text,
        description: descriptionController.text,
        completed: false);
    final resultOrExeption = await _repository.addTodo(dto: dto);
    resultOrExeption.fold(
      (left) => Get.showSnackbar(
        GetSnackBar(
          message: left,
        ),
      ),
      (right) => Get.back(result: right),
    );
  }

  getBack() {
    Get.back();
  }
}
