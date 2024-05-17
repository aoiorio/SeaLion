import 'package:sealion/features/todo/models/todo_model.dart';
import 'package:sealion/features/todo/read_todo/domain/repositories/read_todo_repository.dart';
import 'package:sealion/features/todo/read_todo/infrastracture/datasources/read_all_todos_data_source.dart';
import 'package:sealion/presentation/resources/data_state.dart';


class ReadTodoRepositoryImpl implements ReadTodoRepository {
  final ReadTodoDataSource _readTodoDataSource;

  // これは渡さなくてもいいのか？？
  ReadTodoRepositoryImpl(this._readTodoDataSource);

  // I must use TodoModel instead of TodoEntity because TodoEntity must be independent
  @override
  Future<List<TodoModel>> readAllTodos() async {
    final res = await _readTodoDataSource.readAllTodos();
    try {
      if (res.response.statusCode == 200) {
        return res.data;
      } else {
        print('something went wrong on readAllTodos method');
        throw "readAllTodo method went wrong";
      }
    } catch (e) {
      print('e');
      throw Failure(res.response.statusMessage!);
    }
  }

  @override
  Future<TodoModel> readSpecificTodo({required int todoId}) async {
    final res = await _readTodoDataSource.readSpecificTodo(todoId);
    try {
      if (res.response.statusCode == 200) {
        return res.data;
      } else {
        throw "readSpecificTodo method went wrong";
      }
    } catch (e) {
      throw Failure(res.response.statusMessage!);
    }
  }
}
