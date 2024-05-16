import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sealion/features/todo/application/usecases/update_todo_usecase_impl.dart';
import 'package:sealion/features/todo/update_todo/infrastructure/datasources/update_todo_data_source.dart';
import 'package:sealion/features/todo/update_todo/infrastructure/repository/update_todo_repository_impl.dart';

final networkServiceProvider = Provider<Dio>((ref) {
  final Dio dio = Dio();
  return dio;
});

final updateTodoDataSourceProvider = Provider.family<UpdateTodoDataSource, Dio>(
  (_, dio) => UpdateTodoDataSource(dio),
);

// TODO move this to application folder
final updateTodoUseCaseProvider = Provider<UpdateTodoUseCaseImpl>(
  (ref) {
    final dio = ref.watch(networkServiceProvider);
    final dataSource = ref.watch(updateTodoDataSourceProvider(dio));
    final repository = UpdateTodoRepositoryImpl(dataSource);
    final useCase = UpdateTodoUseCaseImpl(repository);

    return useCase;
  },
);
