import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:todo_api/src/infrastructure/routes/route_names.dart';
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
    rxtodoModelsList.clear();
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

  Future<void> goToAddPage() async {
    final dynamic result = await Get.toNamed(
        "${RouteNamess.homePageRoute}${RouteNamess.addPageRoute}");
    if (result != null) {
      final TodoModel newTodo = TodoModel.fromJson(result);
      rxtodoModelsList.add(newTodo);
    }
  }
}
