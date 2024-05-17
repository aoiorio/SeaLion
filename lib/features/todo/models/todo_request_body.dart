import 'package:json_annotation/json_annotation.dart';
part 'todo_request_body.g.dart';

@JsonSerializable()
class TodoRequestBody {
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'priority')
  int priority;
  @JsonKey(name: 'complete')
  bool complete;

  TodoRequestBody({required this.title, required this.description, required this.priority, required this.complete});
  factory TodoRequestBody.fromJson(Map<String, dynamic> json) =>
      _$TodoRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$TodoRequestBodyToJson(this);
}
