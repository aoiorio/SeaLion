import 'package:sealion/features/todo/models/todo_request_body.dart';


// ! this file must be independent
abstract class UpdateTodoRepository {
  Future<String> updateTodo({required int todoId, required TodoRequestBody todoRequestBody});
}
