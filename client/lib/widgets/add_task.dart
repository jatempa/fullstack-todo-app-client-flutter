import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:client/data/logic/task_provider.dart';

class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Create Task'),
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _textEditingController,
                      validator: (value) {
                        return value!.isNotEmpty ? null : "Enter any text";
                      },
                      decoration: const InputDecoration(
                        hintText: 'Add your task'
                      ),
                    )
                  ],
                )
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue
                  ),
                  child: Text('Save'.toUpperCase()),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final newTask = _textEditingController.text;
                      await ref
                        .read(taskControllerProvider.notifier)
                        .createTask(newTask);
                      ref.invalidate(taskControllerProvider);

                      _textEditingController.clear();

                      if (!mounted) return;

                      Navigator.of(context).pop();
                    }
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black
                  ),                  
                  child: Text('Cancel'.toUpperCase()),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}