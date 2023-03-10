import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:client/data/logic/task_provider.dart';
import 'package:client/widgets/task_item.dart';

class TaskList extends ConsumerWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(taskControllerProvider);
    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (tasks) => ListView.builder(
        itemCount: tasks?.length,
        itemBuilder: (context, index) {
          final task = tasks?[index];
          return ProviderScope(
            overrides: [
              currentTaskId.overrideWithValue(task?.id)
            ],
            child: TaskItem(
              title: task?.title,
              done: task?.done
            )
          );
        }
      ),
      error: (error, stackTrace) => Center(child: Text(error.toString())),
    );
  }
}
