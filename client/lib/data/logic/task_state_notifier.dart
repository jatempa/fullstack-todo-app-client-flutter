import 'dart:async';
import 'package:client/domain/entities/task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:client/data/logic/task_provider.dart';
import 'package:client/data/repositories/task_repository.dart';

class TaskController extends AutoDisposeAsyncNotifier<List<Task>?> {

  @override
  Future<List<Task>?> build() async {
    final taskRepository = ref.read(taskRepositoryProvider);
    return await taskRepository.fetchAll();
  }
}
