import 'package:flutter/material.dart';
import 'package:artemis/artemis.dart';

import 'package:client/data/graphql/query/GetAllTasks.graphql.dart';
import 'package:client/models/Task.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _artemisClient = ArtemisClient('http://10.0.2.2:4000/');

  Future<List<Task>?> getTasks() async {
    try {
      final response = await _artemisClient.execute(GetAllTasksQuery());

      if (response.hasErrors) {
        throw ErrorDescription('Error: ${response.errors?.first.message}');
      }

      final tasks = response.data?.tasks;

      return tasks?.map((task) => Task.fromMap(task?.toJson())).toList();
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
              final task = tasks?[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text('${task?.title}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  trailing: (task != null && task.done)
                  ? Container(color: Colors.green, width: 25, height: 25)
                  : Container(color: Colors.grey, width: 25, height: 25),
                )
              );
            },
          );
        }
      )
    );
  }
}
