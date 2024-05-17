import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// my file
import 'package:sealion/features/todo/update_todo/infrastructure/datasources/update_todo_data_source.dart';

final networkServiceProvider = Provider<Dio>((ref) {
  final Dio dio = Dio();
  return dio;
});

final updateTodoDataSourceProvider = Provider.family<UpdateTodoDataSource, Dio>(
  (_, dio) => UpdateTodoDataSource(dio),
);
