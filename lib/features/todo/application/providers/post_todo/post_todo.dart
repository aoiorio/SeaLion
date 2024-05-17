import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sealion/features/todo/application/usecases/post_todo_usecase_impl.dart';
import 'package:sealion/features/todo/models/todo_request_body.dart';
import 'package:sealion/features/todo/post_todo/infrastructure/providers/post_todo.dart';
import 'package:sealion/features/todo/post_todo/infrastructure/repository/post_todo_repository_impl.dart';

import '../../../../../presentation/pages/search.dart';

part 'post_todo.g.dart';

@riverpod
Future postTodo(Ref ref, TodoRequestBody todoRequestBody) async {
  final dio = ref.watch(networkServiceProvider);
  final todoId = ref.watch(todoIdProvider);
  final dataSource = ref.watch(postTodoDataSourceProvider(dio));
  final repository = PostTodoRepositoryImpl(dataSource);
  final useCase = PostTodoUseCaseImpl(repository);
  final result =
      useCase.postTodoExecute(todoId: todoId, todoRequestBody: todoRequestBody);

  return result;
}
