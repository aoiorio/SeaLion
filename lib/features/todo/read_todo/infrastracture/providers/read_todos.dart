import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sealion/features/todo/application/usecases/read_todo_usecase_impl.dart';
import 'package:sealion/features/todo/read_todo/infrastracture/datasources/read_all_todos_data_source.dart';
import 'package:sealion/features/todo/read_todo/infrastracture/repository/read_todo_repository_impl.dart';

final networkServiceProvider = Provider<Dio>((ref) {
  final Dio dio = Dio();
  return dio;
});

final readTodoDataSourceProvider = Provider.family<ReadTodoDataSource, Dio>(
  (_, dio) => ReadTodoDataSource(dio),
);

final readTodoUseCaseProvider = Provider<ReadTodoUseCaseImpl>(
  (ref) {
    final dio = ref.watch(networkServiceProvider);
    final dataSource = ref.watch(readTodoDataSourceProvider(dio));
    final repository = ReadTodoRepositoryImpl(dataSource);
    final useCase = ReadTodoUseCaseImpl(repository);

    return useCase;
  },
);


