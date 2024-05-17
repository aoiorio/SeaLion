// It must be independent!!! as an Entity

class TodoEntity {
  final String title;
  final String description;
  final int priority;
  final bool complete;

  const TodoEntity({
    required this.title,
    required this.description,
    required this.priority,
    required this.complete,
  });
}