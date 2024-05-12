import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sealion/features/todo/application/providers/todo.dart';
import 'package:sealion/features/todo/model/todo_model.dart';

// final allTodosProvider = StateNotifierProvider<NoteNotifier, List<NotesModel>>(
//     (ref) => NoteNotifier());
// final allTodoProvider = Provider<ReadTodoUseCaseImpl>((ref) {
//   return ReadTodoUseCaseImpl(
//     ref.read(dioProvider),
//   );
// });
// 1. declare a [StateProvider]
// final counterProvider = StateProvider<int>((ref) {
//   return 1;
// });
final counterProvider = NotifierProvider<Counter, int>(() {
  return Counter();
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final counter = ref.watch(counterProvider);

    // if todos are not found, return [] instead of data.
    final List<TodoModel> todos = ref.watch(todoProvider).value ?? [];
    print(todos);
    if (todos.isEmpty) {
      print('todos are empty now!!!!');
    }

    return Center(
      child: todos.isEmpty
          ? const SizedBox(
              height: 50, //指定
              width: 50,
              child: CircularProgressIndicator(strokeWidth: 8.0),
            )
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Card(
                      child: Column(
                        children: [
                          Text(todos[index].title),
                          const SizedBox(height: 100, width: 100),
                          Text(todos[index].description)
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
