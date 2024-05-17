import 'package:flutter/material.dart';

// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wtf_rotary_dial/wtf_rotary_dial.dart';

// my files
import 'package:sealion/features/todo/application/providers/post_todo/post_todo.dart';
import 'package:sealion/features/todo/models/todo_request_body.dart';

// final isCompleteProvider = Provider<bool>((ref) => false);

class PostTodoPage extends ConsumerWidget {
  PostTodoPage({super.key});

  // NOTE it'll dispose if I don't use.
  final AutoDisposeStateProvider<bool> _isCompleteProvider =
      StateProvider.autoDispose((ref) {
    return false;
  });

  final AutoDisposeStateProvider<int> _priorityProvider =
      StateProvider.autoDispose((ref) => 1);

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SeaLion'),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'title',
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'description',
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                const Text(
                  'Complete',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Checkbox(
                  value: ref.watch(_isCompleteProvider),
                  onChanged: (value) {
                    ref.read(_isCompleteProvider.notifier).state = value!;
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      'Priority',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ref.watch(_priorityProvider).toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ],
                ),
                SizedBox(
                  width: 400,
                  height: 300,
                  child: RotaryDial(
                    onDigitSelected: (value) {
                      if (value >= 6 || value <= 0) return;
                      ref.watch(_priorityProvider.notifier).state = value;
                    },
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                    rotaryDialThemeData: RotaryDialThemeData(
                      spinnerColor: const Color(0xFFFFFFFF),
                      rotaryDialColor: const Color.fromARGB(255, 99, 105, 113),
                      dialColor: const Color.fromARGB(255, 99, 105, 113),
                      numberColor: const Color(0xFFFFFFFF),
                      // margin: null,
                      // dialBorderRadius: null,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 250,
              height: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  if (_titleController.text.trim().isEmpty ||
                      _descriptionController.text.trim().isEmpty ||
                      _titleController.text.trim().length < 6 ||
                      _descriptionController.text.trim().length < 6) {
                    return;
                  }
                  ref.read(
                    postTodoProvider(
                      TodoRequestBody(
                        title: _titleController.text,
                        description: _descriptionController.text,
                        priority: ref.read(_priorityProvider),
                        complete: ref.read(_isCompleteProvider),
                      ),
                    ),
                  );
                  // NOTE reset everything I did.
                  _titleController.clear();
                  _descriptionController.clear();
                  ref.read(_isCompleteProvider.notifier).state = false;
                  ref.read(_priorityProvider.notifier).state = 1;
                  Navigator.of(context).pop();
                },
                child: Ink(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 66, 79, 98),
                        Color.fromARGB(255, 78, 106, 134)
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Container(
                    constraints: const BoxConstraints(
                      minWidth: 230,
                      minHeight: 50,
                    ), // min sizes for Material buttons
                    alignment: Alignment.center,
                    child: const Text(
                      'Post Todo',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
