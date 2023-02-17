import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:client/data/logic/task_provider.dart';
import 'package:client/domain/entities/task.dart';

class TaskController extends AutoDisposeAsyncNotifier<List<Task>?> {

  @override
  Future<List<Task>?> build() async {
    final taskRepository = ref.read(taskRepositoryProvider);
    return await taskRepository.fetchAllTasks();
  }

  Future<void> updateTask(String? id) async {
    final taskRepository = ref.read(taskRepositoryProvider);
    await taskRepository.updateTask(id);
  }

  Future<void> createTask(String? newTask) async {
    final taskRepository = ref.read(taskRepositoryProvider);
    await taskRepository.createTask(newTask);
  }
}
