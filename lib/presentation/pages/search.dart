import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sealion/features/todo/application/providers/read_todo/read_specific_todo.dart';

// this provider is for updating todoId
/* NOTE
you can use
final notifier = ref.read(todoIdProvider.notifier);
notifier.state = todoId;
to update todoId
*/
final todoIdProvider = StateProvider<int>(
  (ref) {
    return 0;
  },
);

TextEditingController todoIdController = TextEditingController();

class SearchPage extends ConsumerWidget {
  const SearchPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // read todo from a todo_id that user entered.
    Widget todo = ref.watch(readSpecificTodoProvider).when(
          data: (data) => Card(
            child: Text(data.title),
          ),
          error: (error, stackTrace) {
            if (error.toString() ==
                'Null check operator used on a null value') {
              return const Text("Todo not found");
            } else {
              throw error;
            }
          },
          loading: () => const CircularProgressIndicator(),
        );

    // set todoId for fetching a specific todo by using
    setTodoId(WidgetRef ref, int todoId) {
      final notifier = ref.read(todoIdProvider.notifier);
      notifier.state = todoId;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            todo,
            Container(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: todoIdController,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.trim() != '') {
                    setTodoId(ref, int.parse(value));
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 180,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  if (todoIdController.text.trim() != '') {
                    setTodoId(ref, int.parse(todoIdController.text));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Search a todo',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
