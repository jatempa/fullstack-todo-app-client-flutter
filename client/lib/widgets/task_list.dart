import 'package:flutter/material.dart';

import 'package:client/di/app.dart';
import 'package:client/domain/entities/Task.dart';
import 'package:client/domain/services/TaskService.dart';
import 'package:client/widgets/task_item.dart';

class TaskList extends StatefulWidget {

  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final _svc = getIt<TaskService>();

  Future<List<Task>?> getTasks() async {
    try {
      return _svc.fetchAll();
    } catch (e) {
      debugPrint('$e');
    }

    return null;
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
                final updatedTask = await _svc.update(task?.id);
                setState(() => task = updatedTask);
              },
              child: TaskItem(task: task)
            );
          }
        );
      }
    );
  }
}
