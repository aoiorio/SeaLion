import 'package:sealion/features/todo/models/todo_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../../../../presentation/config/env.dart';

part 'read_all_todos_data_source.g.dart';

// NOTE this file is for getting todo data from AWS API Gateway URL
// このfolderはFastAPIのコードをAWSにデプロイしたURLからデータを取得して、フロントエンドに繋げる役割を担っています。
// さて、このabstract class をimpl classも作るかということですが、作った方がいいと思う。
// なぜなら、その方がrepositoryのimplファイルが汚れずに済むから！！！！！
// retrofit すごすぎる！！！ fromJsonメソッドまで書いてくれている！！！！（いや、自分で書いたものを読み込んでいただけね！）凄すぎ！！

@RestApi(baseUrl: todoBaseUrl)
abstract class ReadTodoDataSource {
  factory ReadTodoDataSource(Dio dio) = _ReadTodoDataSource;
  @GET('/')
  Future<HttpResponse<List<TodoModel>>> readAllTodos();

  @GET('/specific/')
  Future<HttpResponse<TodoModel>> readSpecificTodo(
    @Query("todo_id") int todoId,
  );
}
