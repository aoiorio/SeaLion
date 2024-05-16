import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// packages
import 'package:flutter/services.dart';
import 'package:sealion/features/todo/application/providers/read_todo/read_specific_todo.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart';

// models
import 'package:sealion/features/todo/model/todo_request_body.dart';

// providers
import '../../features/todo/application/providers/delete_todo/delete_todo.dart';
import '../../features/todo/update_todo/infrastructure/providers/update_todo.dart';

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

// NOTE for storing voice text value that was recognized
final voiceTextProvider = StateProvider<String>(
  (ref) {
    return '';
  },
);

final isListeningProvider = StateProvider<bool>((ref) {
  return false;
});

final isDoneCheckProvider = StateProvider<bool>((ref) {
  // final isDone = ref.watch(readSpecificTodoProvider).when(data: (data) => data.complete, error: (error, stackTrace) => false, loading: () => false,);
  return false;
});

TextEditingController todoIdController = TextEditingController();
TextEditingController titleController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
TextEditingController completeController = TextEditingController(text: 'false');
TextEditingController priorityController = TextEditingController();

final initValue = StateProvider<int>((ref) => 0);

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends ConsumerState<SearchPage> {
  // it'll be my speech text that I spoke
  SpeechToText speechToText = SpeechToText();
  bool isComplete = false;

  // NOTE set todoId for fetching a specific todo by using
  setTodoId(WidgetRef ref, int todoId) {
    final notifier = ref.read(todoIdProvider.notifier);
    notifier.state = todoId;
  }

  @override
  Widget build(BuildContext context) {
    // ! DO NOT write like this: todoValue = ref.watch(isDoneCheckProvider.notifier).state because it won't work correctly!!!!
    // I don't know why, ずっと前の値を持ってきているから？？？

    // NOTE read todo from a todo_id that user entered.
    // 初期値を読み込めないよ！！！例えば、何も触らなくてその次
    Widget todo = ref.watch(readSpecificTodoProvider).when(
          data: (data) {
            // NOTE set default values of TextFields
            titleController = TextEditingController(text: data.title);
            descriptionController =
                TextEditingController(text: data.description);

            isComplete = data.complete;
            completeController =
                TextEditingController(text: data.complete.toString());
            priorityController =
                TextEditingController(text: data.priority.toString());

            // NOTE return widgets
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: 'Type title',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.title),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Type description',
                      border: OutlineInputBorder(),
                      prefix: Icon(Icons.description),
                    ),
                  ),
                ),

                /*
                1. isCompleteがtrueだったら、isDoneCheckProviderの値をtrueに一回だけ変える
                2.
                */
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Complete',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 30),
                    Checkbox(
                      // NOTE set default value so it'll check that it's first time to confirm.
                      value: isComplete && ref.watch(initValue) == 0
                          ? true
                          : ref.watch(isDoneCheckProvider),
                      onChanged: (value) {
                        if (ref.watch(initValue) == 0 && isComplete) {
                          print(ref.watch(isDoneCheckProvider));

                          ref.watch(isDoneCheckProvider.notifier).state = true;
                        }

                        // print(value);
                        if (value == null) {
                          return;
                        }
                        if (isComplete &&
                            ref.watch(isDoneCheckProvider) == value) {
                          ref.watch(isDoneCheckProvider.notifier).state =
                              data.complete;
                          // NOTE increase default value, it'll execute only once
                          ref.watch(initValue.notifier).state++;
                          return;
                        }
                        // print(ref.watch(isDoneCheck.notifier).state);
                        ref.watch(isDoneCheckProvider.notifier).state = value;
                        ref.watch(initValue.notifier).state++;
                        // print(ref.watch(isDoneCheck.notifier).state);
                      },
                    ),
                  ],
                ),
              ],
            );
          },
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

    // NOTE widgets that will display on the screenscreen
    return Scaffold(
      appBar: AppBar(
        title: const Text("SeaLion"),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            todo,
            // todo,
            Container(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: todoIdController,
                keyboardType: TextInputType.number,
                // NOTE This code means that limiting String value of this TextField. If you don't use it, you can't limit the value.
                // LINK Please refer: https://qiita.com/beckyJPN/items/912cb61cfee813bf4a70
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  if (value.trim() != '') {
                    setTodoId(ref, int.parse(value));
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Type todo id...',
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
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomRight,
                      colors: [
                        Color.fromARGB(255, 114, 124, 170),
                        Color.fromARGB(255, 98, 114, 138),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton(
                    onPressed: todo.runtimeType == Text ||
                            todo.runtimeType == CircularProgressIndicator
                        ? null
                        : () {
                            ref
                                .watch(updateTodoUseCaseProvider)
                                .executeUpdateTodo(
                                  todoId:
                                      ref.watch(todoIdProvider.notifier).state,
                                  todoRequestBody: TodoRequestBody(
                                    title: titleController.text,
                                    description: descriptionController.text,
                                    priority:
                                        int.parse(priorityController.text),
                                    // NOTE for avoiding sending wrong value (もし、checkboxを何も操作しないでその時のdbから持ってきた値がtrueだった場合、リセットされないようにtrueを返す。)
                                    complete:
                                        isComplete && ref.watch(initValue) == 0
                                            ? true
                                            : ref.watch(isDoneCheckProvider),
                                  ),
                                );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      surfaceTintColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Update Todo'),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                  // NOTE if todo widget is loading or todo not found Text, button will be null.
                  onPressed: todo.runtimeType == Text ||
                          todo.runtimeType == CircularProgressIndicator
                      ? null
                      : () async {
                        // NOTE execute deleteTodo function through provider
                          ref.read(deleteTodoProvider);
                          // NOTE for initializing todo deleted
                          // FIXME - fix it??
                          // STUB - I think I should do error handling when I develop actual project.
                          ref.watch(todoIdProvider.notifier).state = 0;
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 214, 95, 95),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Delete Todo'),
                ),
              ],
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: AvatarGlow(
                glowColor: Colors.black,
                duration: const Duration(milliseconds: 2000),
                glowRadiusFactor: 20,
                repeat: true,
                animate: ref.watch(isListeningProvider),
                child: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    iconSize: 40,
                  ),
                  onPressed: () async {
                    // NOTE if user didn't push the button before
                    if (!ref.watch(isListeningProvider)) {
                      bool available = await speechToText.initialize();
                      if (available) {
                        ref.watch(isListeningProvider.notifier).state = true;
                        speechToText.listen(
                          onResult: (result) {
                            ref.watch(voiceTextProvider.notifier).state =
                                result.recognizedWords;
                          },
                        );
                      }
                    } else {
                      // NOTE if user pushed the button before, stop to listen.
                      ref.watch(isListeningProvider.notifier).state = false;
                      // NOTE stop listening because if I didn't do that, it'll store every words I said before
                      speechToText.stop();
                    }
                  },
                  icon: const Icon(Icons.keyboard_voice),
                ),
              ),
            ),
            // NOTE display the audio text you spoke
            Text(ref.read(voiceTextProvider.notifier).state),
          ],
        ),
      ),
    );
  }
}
