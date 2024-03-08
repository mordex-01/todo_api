import 'package:get/get.dart';
import 'package:todo_api/src/pages/edit/controller/edit_controller.dart';

class EditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditController());
  }
}
