// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// my files
import '../../../../../presentation/pages/search.dart';
import '../../../models/todo_request_body.dart';
import '../../../update_todo/infrastructure/providers/update_todo.dart';
import '../../../update_todo/infrastructure/repository/update_todo_repository_impl.dart';
import '../../usecases/update_todo_usecase_impl.dart';
part 'update_todo.g.dart';

@riverpod
Future updateTodo(Ref ref, TodoRequestBody todoRequestBody) async {
  final dio = ref.watch(networkServiceProvider);
  final todoId = ref.watch(todoIdProvider);
  final dataSource = ref.watch(updateTodoDataSourceProvider(dio));
  final repository = UpdateTodoRepositoryImpl(dataSource);
  final useCase = UpdateTodoUseCaseImpl(repository);
  final result = useCase.executeUpdateTodo(
      todoId: todoId, todoRequestBody: todoRequestBody);

  return result;
}
