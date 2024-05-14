import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sealion/features/todo/application/providers/read_todo/read_specific_todo.dart';
import 'package:sealion/features/todo/application/providers/read_todo/read_todo.dart';
import 'package:sealion/features/todo/model/todo_model.dart';
import 'package:sealion/presentation/pages/search.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // if todos are not found, return [] instead of data.
    TextEditingController todoIdController = TextEditingController();
    final List<TodoModel> todos = ref.watch(readTodoProvider).value ?? [];
    // List<TodoModel> todo = ref.read(readSpecificTodoProvider(2)).value ?? [];

    // TODO create different page for fetching specific todo

    return Center(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: todoIdController,
              onChanged: (value) {
                // todo
                // print(value);
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                print('print something');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchPage(
                        
                      );
                    },
                  ),
                );
              },
              child: const Text("Search this todo")),
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
          // todos.isEmpty
          //     ? const SizedBox(
          //         height: 50, //指定
          //         width: 50,
          //         child: CircularProgressIndicator(strokeWidth: 8.0),
          //       )
          //     :
        ],
      ),
    );
  }
}
