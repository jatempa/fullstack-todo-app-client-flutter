import 'package:flutter/foundation.dart';

import 'package:client/domain/entities/Task.dart';
import 'package:client/domain/interfaces/ITaskRepository.dart';

class TaskService {
  final ITaskRepository repository;

  const TaskService({
    required this.repository
  });

  Future<List<Task>?> fetchAll() async {
    try {
      return await repository.fetchAll();
    } catch (e) {
      debugPrint('$e');
    }

    return null;
  }

  Future<Task?> update(String? id) async {
    try {
      return await repository.update(id);
    } catch (e) {
      debugPrint('$e');
    }

    return null;
  }
}
