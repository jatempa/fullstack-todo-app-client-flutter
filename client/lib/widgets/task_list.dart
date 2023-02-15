import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:client/di/providers.dart';
import 'package:client/domain/entities/Task.dart';
import 'package:client/widgets/task_item.dart';

class TaskList extends ConsumerStatefulWidget {

  const TaskList({super.key});

  @override
  ConsumerState<TaskList> createState() => _TaskListState();
}

class _TaskListState extends ConsumerState<TaskList> {
  Future<List<Task>?> getTasks() async {
    return await ref.read(taskServiceProvider).fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Task>?>(
      future: getTasks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        final tasks = snapshot.data;

        return ListView.builder(
          itemCount: tasks?.length,
          itemBuilder: (context, index) {
            var task = tasks?[index];
            return GestureDetector(
              onTap: () async {
                // final updatedTask = await _svc.update(task?.id);
                // setState(() => task = updatedTask);
              },
              child: TaskItem(task: task)
            );
          }
        );
      }
    );
  }
}
