import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sealion/features/todo/application/usecases/read_todo_usecase_impl.dart';
import 'package:sealion/features/todo/model/todo_model.dart';
import 'package:sealion/features/todo/read_todo/infrastracture/datasources/read_all_todos_data_source.dart';

import '../../read_todo/infrastracture/repository/read_todo_repository_impl.dart';
// TODO make sure to grasp every thing of what the Riverpod is!!!

part 'todo.g.dart';

@riverpod
class Todo extends _$Todo {
  @override
  FutureOr<List<TodoModel>> build() async {
    final _dio = Dio();

    // これ絶対にやり方が違う気がします隊長！！！！me tooooooo!!!!!
    ReadTodoUseCaseImpl _readTodoUseCaseImpl =
        ReadTodoUseCaseImpl(ReadTodoRepositoryImpl(ReadTodoDataSource(_dio)));
    final todos = await _readTodoUseCaseImpl.executeReadAllTodos();
    return todos;
  }
}

class Counter extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }
}
