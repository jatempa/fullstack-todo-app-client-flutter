import 'package:flutter/foundation.dart';

import 'package:client/data/data_sources/task_remote_data_provider.dart';
import 'package:client/domain/entities/task.dart';

abstract class ITaskRepository {
  Future<List<Task>?> fetchAllTasks();
  Future<Task?> updateTask(String? id);
}

class TaskRepository implements ITaskRepository {
  final TaskRemoteDataProvider remoteDataProvider;

  const TaskRepository({
    required this.remoteDataProvider
  });

  @override
  Future<List<Task>?> fetchAllTasks() async {
    try {
      final tasks = await remoteDataProvider.getTasks();
      return tasks?.map((task) => Task.fromJson(task.toJson())).toList();
    } catch (e) {
      debugPrint('$e');
    }

    return null;
  }

  @override
  Future<Task?> updateTask(String? id) async {
    try {
      final task = await remoteDataProvider.updateTask(id);
      return Task.fromJson(task?.toJson());
    } catch (e) {
      debugPrint('$e');
    }

    return null;
  }
}
