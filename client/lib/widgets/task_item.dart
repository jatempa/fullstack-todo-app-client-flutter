import 'package:flutter/material.dart';

import 'package:client/domain/entities/Task.dart';

class TaskItem extends StatelessWidget {
  final Task? task;

  const TaskItem({super.key, this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          '${task?.title}',
          style: const TextStyle(
            fontWeight: FontWeight.bold
          )
        ),
        trailing: _buildStatusIndicator(task),
      )
    );
  }

  _buildStatusIndicator(Task? task) {
    return (task != null && task.done!)
    ? Container(color: Colors.green, width: 25, height: 25)
    : Container(color: Colors.grey, width: 25, height: 25);
  }
}