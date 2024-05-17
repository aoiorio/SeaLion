import 'package:sealion/features/todo/entity/todo_entity.dart';

abstract class ReadTodoRepository {
  Future<List<TodoEntity>> readAllTodos();

  Future<TodoEntity> readSpecificTodo({required int todoId});
}
