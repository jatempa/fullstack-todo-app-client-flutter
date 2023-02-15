import 'package:flutter/foundation.dart';
import 'package:artemis/artemis.dart';
import 'package:injectable/injectable.dart';

import 'package:client/data/graphql/query/GetAllTasks.graphql.dart';
import 'package:client/data/models/Task.dart';

@lazySingleton
class TaskRemoteDataProvider {
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
}