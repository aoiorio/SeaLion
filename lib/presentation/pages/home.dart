import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sealion/features/todo/application/providers/read_todo/read_todo.dart';
import 'package:sealion/features/todo/model/todo_model.dart';
import 'package:sealion/presentation/pages/search.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // if todos are not found, return [] instead of data.
    final List<TodoModel> todos = ref.watch(readTodoProvider).value ?? [];

    // DONE create different page for fetching specific todo

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 230,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const SearchPage();
                      },
                    ),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Search Todo",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            todos.isEmpty
                ? const SizedBox(
                    child: CircularProgressIndicator(strokeWidth: 8.0))
                : Expanded(
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Card(
                              child: Column(
                                children: [
                                  Text(todos[index].title),
                                  const SizedBox(height: 100, width: 100),
                                  Text(todos[index].description),
                                  Text(todos[index].complete.toString())
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
