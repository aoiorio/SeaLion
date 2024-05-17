import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sealion/features/todo/post_todo/infrastructure/datasource/post_todo_data_source.dart';

final networkServiceProvider = Provider<Dio>((ref) {
  final Dio dio = Dio();
  return dio;
});

final postTodoDataSourceProvider = Provider.family<PostTodoDataSource, Dio>(
  (_, dio) => PostTodoDataSource(dio),
);