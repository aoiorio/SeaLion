import 'package:sealion/features/todo/delete_todo/infrastructure/repository/delete_todo_repository_impl.dart';

import '../../delete_todo/domain/usecase/delete_todo_usecase.dart';

class DeleteTodoUseCaseImpl implements DeleteTodoUseCase {
  final DeleteTodoRepositoryImpl _deleteTodoRepositoryImpl;
  DeleteTodoUseCaseImpl(this._deleteTodoRepositoryImpl);
  @override
  Future<String> deleteTodoExecute({required int todoId}) {
    final res = _deleteTodoRepositoryImpl.deleteTodo(todoId: todoId);
    return res;
  }
}
