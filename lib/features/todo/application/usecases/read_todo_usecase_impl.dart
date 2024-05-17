import 'package:sealion/features/todo/models/todo_model.dart';
import 'package:sealion/features/todo/read_todo/domain/usecases/read_todo_usecase.dart';
import 'package:sealion/features/todo/read_todo/infrastracture/repository/read_todo_repository_impl.dart';

// ! You must change TodoEntity to TodoModel because TodoEntity must be independent.
// たぶん、ここで実装してあるrepositoryを呼び出して実行するんだわ。
// my Folderは大抵一つの機能しか作らないから２個は珍しい。
// そして、providerもここで扱う気がしてきた。
class ReadTodoUseCaseImpl implements ReadTodoUseCase {
  final ReadTodoRepositoryImpl _readTodoRepositoryImpl;
  ReadTodoUseCaseImpl(this._readTodoRepositoryImpl);

  @override
  Future<List<TodoModel>> executeReadAllTodos() async {
    final todos = await _readTodoRepositoryImpl.readAllTodos();
    return todos;
  }

  @override
  Future<TodoModel> executeReadSpecificTodo({required int todoId}) async {
    final todo = await _readTodoRepositoryImpl.readSpecificTodo(todoId: todoId);
    return todo;
  }
}
