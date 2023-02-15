import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:client/di/providers.dart';
import 'package:client/widgets/task_item.dart';

class TaskList extends ConsumerWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(tasksProvider).when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, trace) => Center(child: Text(error.toString())),
      data: (tasks) => ListView.builder(
        itemCount: tasks?.length,
        itemBuilder: (context, index) => TaskItem(task: tasks?[index])
      )
    );
  }
}
