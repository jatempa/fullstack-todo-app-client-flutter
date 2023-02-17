import 'package:flutter/material.dart';

import 'package:client/widgets/add_task.dart';
import 'package:client/widgets/task_list.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const TaskList(),
      floatingActionButton: const AddTask()
    );
  }
}
