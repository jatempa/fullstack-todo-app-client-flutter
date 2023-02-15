import 'package:flutter/foundation.dart';

import 'package:client/data/data_sources/TaskRemoteDataProvider.dart';
import 'package:client/domain/entities/Task.dart';
import 'package:client/domain/interfaces/ITaskRepository.dart';

class TaskRepository implements ITaskRepository {
  final TaskRemoteDataProvider remoteDataProvider;

  const TaskRepository({
    required this.remoteDataProvider
  });

  @override
  Future<List<Task>?> fetchAll() async {
    try {
      final tasks = await remoteDataProvider.getTasks();
      return tasks?.map((task) => Task.fromJson(task.toJson())).toList();
    } catch (e) {
      debugPrint('$e');
    }

    return null;
  }

  @override
  Future<Task?> update(String? id) async {
    try {
      final task = await remoteDataProvider.updateTask(id);
      return Task.fromJson(task?.toJson());
    } catch (e) {
      debugPrint('$e');
    }

    return null;
  }
}
