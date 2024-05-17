import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sealion/presentation/config/env.dart';

import '../../../models/todo_request_body.dart';

part 'post_todo_data_source.g.dart';

@RestApi(baseUrl: todoBaseUrl)
abstract class PostTodoDataSource {
  factory PostTodoDataSource(Dio dio) = _PostTodoDataSource;

  @POST('/')
  Future<HttpResponse> postTodo(
    @Query('todo_id') int todoId,
    @Body() TodoRequestBody request,
  );
}
