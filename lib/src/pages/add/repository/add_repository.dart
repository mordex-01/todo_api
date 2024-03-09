import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:todo_api/src/infrastructure/common/repository_utils.dart';
import 'package:todo_api/src/pages/add/model/add_dto.dart';
import 'package:http/http.dart' as http;

class AddRepository {
  Future<Either<String, Map<String, dynamic>>> addTodo(
      {required AddDto dto}) async {
    try {
      var url = Uri.http(RepositoryUtils.webBaseUrl, RepositoryUtils.addTodos);
      final response = await http.post(
        url,
        body: jsonEncode(dto.toJson()),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode >= 200 && response.statusCode < 400) {
        return Right(jsonDecode(response.body));
      } else {
        return Left('${response.statusCode}');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
