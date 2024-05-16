import 'package:sealion/features/todo/model/todo_request_body.dart';

abstract class UpdateTodoUseCase {
  Future<String> executeUpdateTodo({required int todoId, required TodoRequestBody todoRequestBody});
}
