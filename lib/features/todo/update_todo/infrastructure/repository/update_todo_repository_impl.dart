import 'package:sealion/features/todo/model/todo_request_body.dart';
import 'package:sealion/features/todo/update_todo/domain/repositories/update_todo_repository.dart';
import 'package:sealion/features/todo/update_todo/infrastructure/datasources/update_todo_data_source.dart';

class UpdateTodoRepositoryImpl implements UpdateTodoRepository {
  final UpdateTodoDataSource _updateTodoDataSource;

  UpdateTodoRepositoryImpl(this._updateTodoDataSource);
  @override
  Future<String> updateTodo(
      {required int todoId, required TodoRequestBody todoRequestBody}) async {
    final res = await _updateTodoDataSource.updateTodo(todoId, todoRequestBody);
    try {
      if (res.response.statusCode == 200) {
        return 'success';
      } else {
        // print('something went wrong on updateTodo method');
        // throw "readAllTodo method went wrong";
        return res.response.statusMessage!;
      }
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
}
