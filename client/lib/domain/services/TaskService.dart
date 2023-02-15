import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'package:client/domain/entities/Task.dart';
import 'package:client/domain/interfaces/ITaskRepository.dart';

@lazySingleton
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
}
