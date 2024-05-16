import 'package:sealion/features/todo/delete_todo/domain/repository/delete_todo_repository.dart';

import '../datasource/delete_todo_data_source.dart';

class DeleteTodoRepositoryImpl implements DeleteTodoRepository {
  final DeleteTodoDataSource _deleteTodoDataSource;

  DeleteTodoRepositoryImpl(this._deleteTodoDataSource);
  @override
  Future<String> deleteTodo({required int todoId}) async {
    final res = await _deleteTodoDataSource.deleteTodo(todoId);
    try {
      if (res.response.statusCode == 204) {
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
