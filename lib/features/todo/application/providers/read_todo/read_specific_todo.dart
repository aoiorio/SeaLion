import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sealion/features/todo/model/todo_model.dart';
import 'package:sealion/features/todo/read_todo/infrastracture/providers/read_todos.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../presentation/pages/search.dart';

part 'read_specific_todo.g.dart';

// @riverpod
// class ReadSpecificTodo extends _$ReadSpecificTodo {
//   @override
//   FutureOr<List<TodoModel>> build() {
//     // final usecase = ref.watch(readTodoUseCaseProvider);
//     // final todo = await usecase.executeReadSpecificTodo(todoId: todoId);
//     // return todo;
//     // final usecase = ref.watch(readTodoUseCaseProvider);
//     // final todo = await usecase.executeReadSpecificTodo(todoId: todoId);
//     // return [todo];
//     return Future(() => []);
//   }

//   FutureOr<List<TodoModel>> readSpecificTodo(int todoId) async {
//     final usecase = ref.watch(readTodoUseCaseProvider);
//     final TodoModel todo = await usecase.executeReadSpecificTodo(todoId: todoId);
//     return [todo];
//   }
//   // state.add(..value)
//   // Future<TodoModel> readSpecificTodo(int todoId) async {
//   //   final usecase = ref.watch(readTodoUseCaseProvider);
//   //   final todo = await usecase.executeReadSpecificTodo(todoId: todoId);
//   //   return todo;
//   // }
// }

@riverpod
FutureOr<TodoModel> readSpecificTodo(Ref ref) async {
  final usecase = ref.watch(readTodoUseCaseProvider);
  final int todoId = ref.watch(todoIdProvider);
  final TodoModel todo = await usecase
      .executeReadSpecificTodo(todoId: todoId);
  return todo;
}