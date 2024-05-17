import 'package:sealion/features/todo/models/todo_request_body.dart';

abstract class PostTodoRepository {
  Future<String> postTodo(
      {required int todoId, required TodoRequestBody todoRequestBody});
}
