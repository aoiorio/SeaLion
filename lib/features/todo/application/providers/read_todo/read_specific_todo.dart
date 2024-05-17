import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sealion/features/todo/models/todo_model.dart';
import 'package:sealion/features/todo/read_todo/infrastracture/providers/read_todos.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../presentation/pages/search.dart';

part 'read_specific_todo.g.dart';

@riverpod
FutureOr<TodoModel> readSpecificTodo(Ref ref) async {
  final usecase = ref.watch(readTodoUseCaseProvider);
  final int todoId = ref.watch(todoIdProvider);
  final TodoModel todo = await usecase
      .executeReadSpecificTodo(todoId: todoId);
  return todo;
}