import 'package:sealion/features/todo/model/todo_request_body.dart';
import 'package:sealion/features/todo/update_todo/infrastructure/repository/update_todo_repository_impl.dart';

import '../../update_todo/domain/usecases/update_todo_usecase.dart';

class UpdateTodoUseCaseImpl implements UpdateTodoUseCase {
  final UpdateTodoRepositoryImpl _updateTodoRepositoryImpl;
  UpdateTodoUseCaseImpl(this._updateTodoRepositoryImpl);

  @override
  Future<String> executeUpdateTodo(
      {required int todoId, required TodoRequestBody todoRequestBody}) async {
    final res = await _updateTodoRepositoryImpl.updateTodo(
        todoId: todoId, todoRequestBody: todoRequestBody);
    return res;
  }
}
