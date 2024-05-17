import 'package:sealion/features/todo/models/todo_request_body.dart';
import 'package:sealion/features/todo/post_todo/domain/repository/post_todo_repository.dart';
import 'package:sealion/features/todo/post_todo/infrastructure/datasource/post_todo_data_source.dart';

class PostTodoRepositoryImpl implements PostTodoRepository {
  final PostTodoDataSource _postTodoDataSource;

  PostTodoRepositoryImpl(this._postTodoDataSource);
  @override
  Future<String> postTodo(
      {required int todoId, required TodoRequestBody todoRequestBody}) async {
    final res = await _postTodoDataSource.postTodo(todoId, todoRequestBody);
    try {
      if (res.response.statusCode == 200) {
        print('success');
        return 'success';
      } else {
        throw res.response.statusMessage!;
      }
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
}
