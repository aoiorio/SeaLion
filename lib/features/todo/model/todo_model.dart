import 'package:sealion/features/todo/entity/todo_entity.dart';

class TodoModel extends TodoEntity {
  const TodoModel({
    required super.title,
    required super.description,
    required super.priority,
    required super.complete,
  });

  factory TodoModel.fromJson(Map<String, dynamic> map) {
    return TodoModel(
      title: map["title"] ?? "",
      description: map["description"] ?? "",
      priority: map["priority"] ?? "",
      complete: map["complete"] ?? "",
    );
  }
}
