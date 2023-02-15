import 'package:artemis/artemis.dart';
import 'package:client/data/graphql/mutation/UpdateTask.graphql.dart';
import 'package:client/domain/entities/Task.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'package:client/data/graphql/query/GetAllTasks.graphql.dart';
import 'package:client/data/models/TaskModel.dart';

@lazySingleton
class TaskRemoteDataProvider {
  final _artemisClient = ArtemisClient('http://10.0.2.2:4000/');

  Future<List<TaskModel>?> getTasks() async {
    try {
      final response = await _artemisClient.execute(GetAllTasksQuery());

      if (response.hasErrors) {
        throw ErrorDescription('Error: ${response.errors?.first.message}');
      }

      final tasks = response.data?.tasks;

      return tasks?.map((task) => TaskModel.fromJson(task?.toJson())).toList();
    } catch (e) {
      debugPrint('$e');
    }

    return null;
  }

  Future<TaskModel?> updateTask(String? id) async {
    try {
      final response = await _artemisClient.execute(
        UpdateTaskMutation(
          variables: UpdateTaskArguments(id: id!)
        )
      );

      if (response.hasErrors) {
        throw ErrorDescription('Error: ${response.errors?.first.message}');
      }

      final task = response.data?.updateTask;

      return TaskModel.fromJson(task?.toJson());
    } catch (e) {
      debugPrint('$e');
    }

    return null;
  }
}