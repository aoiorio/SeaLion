import 'package:sealion/features/todo/entity/todo_entity.dart';

abstract class ReadTodoUseCase {
  Future<List<TodoEntity>> executeReadAllTodos();

  Future<TodoEntity> executeReadSpecificTodo({required int todoId});
}
