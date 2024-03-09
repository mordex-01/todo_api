import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:todo_api/src/infrastructure/common/repository_utils.dart';
import 'package:http/http.dart' as http;
import 'package:todo_api/src/pages/edit/model/edit_dto.dart';

class EditRepository {
  Future<Either<String, String>> editTodo(
      {required String id, required EditDto dto}) async {
    try {
      var url =
          Uri.http(RepositoryUtils.webBaseUrl, RepositoryUtils.editTodo(id));
      final response = await http.patch(
        url,
        body: jsonEncode(dto.toJson()),
        headers: {'Content-Type': 'application/json'},
      );
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
