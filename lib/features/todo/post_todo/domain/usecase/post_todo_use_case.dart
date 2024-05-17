import 'package:sealion/features/todo/models/todo_request_body.dart';

abstract class PostTodoUseCase {
  Future<String> postTodoExecute(
      {required int todoId, required TodoRequestBody todoRequestBody});
}
