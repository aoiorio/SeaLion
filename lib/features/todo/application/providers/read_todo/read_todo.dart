import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sealion/features/todo/model/todo_model.dart';
import 'package:sealion/features/todo/read_todo/infrastracture/providers/read_todos.dart';
// TODO make sure to grasp every thing of what the Riverpod is!!!

part 'read_todo.g.dart';

@riverpod
class ReadTodo extends _$ReadTodo {
  @override
  Future<List<TodoModel>> build() async {

    final usecase = ref.watch(readTodoUseCaseProvider);
    final todos = await usecase.executeReadAllTodos();
    return todos;
  }
  // これ絶対にやり方が違う気がします隊長！！！！me tooooooo!!!!!
}

// TODO add function for implementing reading specific todo!!