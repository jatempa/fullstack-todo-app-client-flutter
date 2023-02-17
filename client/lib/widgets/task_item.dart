import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:client/data/logic/task_provider.dart';
import 'package:client/widgets/status.dart';

class TaskItem extends ConsumerWidget {
  final String? title;
  final bool? done;

  const TaskItem({super.key, this.title, this.done});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(currentTaskId);
    return Card(
      key: ValueKey(id),
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () async {
          await ref
            .read(taskControllerProvider.notifier)
            .updateTask(id);
          ref.invalidate(taskControllerProvider);
        },
        title: Text('$title',
          style: const TextStyle(
            fontWeight: FontWeight.bold
          )
        ),
        trailing: Status(
          status: done
        )
      )
    );
  }
}
