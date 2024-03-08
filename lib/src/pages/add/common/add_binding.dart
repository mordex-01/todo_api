import 'package:get/get.dart';
import 'package:todo_api/src/pages/add/controller/add_controller.dart';

class Addbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddController());
  }
}
