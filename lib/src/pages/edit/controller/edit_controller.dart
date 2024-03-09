import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_api/src/pages/edit/model/edit_dto.dart';
import 'package:todo_api/src/pages/edit/repository/edit_repository.dart';

class EditController extends GetxController {
  @override
  void onClose() {
    super.onClose();
    userIdController.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  final EditRepository _repository = EditRepository();
  Rx<bool> isChecked = false.obs;
  RxString id = RxString("");
  TextEditingController userIdController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  void onInit() {
    var data = Get.parameters;
    userIdController.text = data['userId']!;
    titleController.text = data['title']!;
    descriptionController.text = data['description']!;
    id = RxString(data['id']!);
    isChecked = RxBool(bool.parse(data['completed']!));
    super.onInit();
  }

  Future<void> onEditTodo() async {
    final dto = EditDto(
        userId: userIdController.text,
        title: titleController.text,
        description: descriptionController.text,
        isCheck: isChecked.value);
    final editOrExeption = await _repository.editTodo(id: id.value, dto: dto);
    editOrExeption.fold(
      (left) => Get.showSnackbar(GetSnackBar(
        message: left,
      )),
      (right) => Get.back(result: right),
    );
  }

  onCheckBoxTapped() {
    isChecked.value = !isChecked.value;
  }
}
