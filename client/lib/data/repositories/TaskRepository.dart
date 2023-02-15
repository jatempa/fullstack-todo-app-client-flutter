import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'package:client/data/data_sources/TaskRemoteDataProvider.dart';
import 'package:client/domain/entities/Task.dart';
import 'package:client/domain/interfaces/ITaskRepository.dart';

@LazySingleton(as: ITaskRepository )
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
}