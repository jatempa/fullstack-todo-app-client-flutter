import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:client/di/providers.dart';
import 'package:client/domain/entities/Task.dart';
import 'package:client/widgets/status.dart';

class TaskItem extends ConsumerWidget {
  final Task? task;

  const TaskItem({super.key, this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      key: ValueKey(task?.id),
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () async {
          await ref.read(taskServiceProvider).update(task?.id);
          ref.refresh(tasksProvider);
        },
        title: Text(
          '${task?.title}',
          style: const TextStyle(
            fontWeight: FontWeight.bold
          )
        ),
        trailing: Status(status: task?.done)
      )
    );
  }
}