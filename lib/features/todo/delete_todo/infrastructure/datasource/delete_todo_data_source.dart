import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';


import '../../../../../presentation/config/env.dart';

part 'delete_todo_data_source.g.dart';

@RestApi(baseUrl: todoBaseUrl)
abstract class DeleteTodoDataSource {
  factory DeleteTodoDataSource(Dio dio) = _DeleteTodoDataSource;
  @DELETE('')
  Future<HttpResponse> deleteTodo(@Query('todo_id') int todoId);

}
