import 'package:sealion/features/todo/models/todo_request_body.dart';
import 'package:sealion/features/todo/post_todo/domain/usecase/post_todo_use_case.dart';
import 'package:sealion/features/todo/post_todo/infrastructure/repository/post_todo_repository_impl.dart';

class PostTodoUseCaseImpl implements PostTodoUseCase {
  final PostTodoRepositoryImpl _postTodoRepositoryImpl;
  PostTodoUseCaseImpl(this._postTodoRepositoryImpl);
  @override
  Future<String> postTodoExecute(
      {required int todoId, required TodoRequestBody todoRequestBody}) async {
    final res = await _postTodoRepositoryImpl.postTodo(
        todoId: todoId, todoRequestBody: todoRequestBody);
    return res;
  }
}
