import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sealion/features/todo/application/usecases/delete_todo_usecase_impl.dart';
import 'package:sealion/features/todo/delete_todo/infrastructure/repository/delete_todo_repository_impl.dart';
import 'package:sealion/presentation/pages/search.dart';
import '../../../delete_todo/infrastructure/providers/delete_todo_provider.dart';

part 'delete_todo.g.dart';

//REVIEW - This is the best way to execute use case impl!!!!
@riverpod
FutureOr<String> deleteTodo(Ref ref) async {
  final dio = ref.watch(networkServiceProvider);
  final dataSource = ref.watch(deleteTodoDataSourceProvider(dio));
  final repository = DeleteTodoRepositoryImpl(dataSource);
  final int todoId = ref.watch(todoIdProvider);
  final result =
      await DeleteTodoUseCaseImpl(repository).deleteTodoExecute(todoId: todoId);
  return result;
}
