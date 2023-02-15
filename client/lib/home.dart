import 'package:flutter/material.dart';

import 'package:client/di/app.dart';
import 'package:client/domain/entities/Task.dart';
import 'package:client/domain/services/TaskService.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
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
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () async {
                    final updatedTask = await _svc.update(task?.id);
                    setState(() => task = updatedTask);
                  },
                  title: Text('${task?.title}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  trailing:  _buildStatusIndicator(task),
                )
              );
            },
          );
        }
      )
    );
  }
  
  _buildStatusIndicator(Task? task) {
    return (task != null && task.done!)
    ? Container(color: Colors.green, width: 25, height: 25)
    : Container(color: Colors.grey, width: 25, height: 25);
  }
}
