// DONE write code about updating todo

import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:sealion/features/todo/models/todo_request_body.dart';

import '../../../../../presentation/config/env.dart';

part 'update_todo_data_source.g.dart';

@RestApi(baseUrl: todoBaseUrl)
abstract class UpdateTodoDataSource {
  factory UpdateTodoDataSource(Dio dio) = _UpdateTodoDataSource;
  @PUT('/')
  Future<HttpResponse> updateTodo(
    @Query("todo_id") int todoId,
    @Body() TodoRequestBody request,
  );
}
