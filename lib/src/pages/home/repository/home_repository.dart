import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:todo_api/src/infrastructure/common/repository_utils.dart';
import 'package:todo_api/src/pages/home/model/todomodel.dart';

class HomeRepository {
  Future<Either<String, List<TodoModel>>> repositoryGetTodos() async {
    try {
      var url = Uri.http(RepositoryUtils.webBaseUrl, RepositoryUtils.getTodos);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> todosList = jsonDecode(response.body);
        final List<TodoModel> todoModelList = [];
        for (var todos in todosList) {
          final todo = TodoModel.fromJson(todos);
          todoModelList.add(todo);
        }

        return Right(todoModelList);
      } else {
        return Left("${response.statusCode}");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> deleteTodo(String id) async {
    try {
      var url =
          Uri.http(RepositoryUtils.webBaseUrl, RepositoryUtils.deleteTodo(id));
      final response = await http.delete(url);
      if (response.statusCode >= 200 && response.statusCode < 400) {
        return Right(response.body);
      } else {
        return Left("${response.statusCode}");
      }
    } catch (e) {
      return Left("$e");
    }
  }
}
