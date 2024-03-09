import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:todo_api/src/pages/home/model/todomodel.dart';
import 'package:todo_api/src/pages/home/repository/home_repository.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    controllerGetTodos();
  }

  final HomeRepository _repository = HomeRepository();
  RxList<TodoModel> rxtodoModelsList = RxList();
  Future<void> controllerGetTodos() async {
    final Either<String, List<TodoModel>> resultOrExeption =
        await _repository.repositoryGetTodos();
    resultOrExeption.fold(
      (left) => Get.showSnackbar(
        GetSnackBar(
          message: left,
        ),
      ),
      (right) => rxtodoModelsList.addAll(right),
    );
  }
}
