import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sealion/features/todo/delete_todo/infrastructure/datasource/delete_todo_data_source.dart';

final networkServiceProvider = Provider<Dio>((ref) {
  final Dio dio = Dio();
  return dio;
});

final deleteTodoDataSourceProvider = Provider.family<DeleteTodoDataSource, Dio>(
  (_, dio) => DeleteTodoDataSource(dio),
);