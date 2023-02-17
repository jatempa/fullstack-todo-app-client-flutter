import 'package:artemis/artemis.dart';
import 'package:client/data/graphql/mutation/create_task.graphql.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:client/data/graphql/mutation/update_task.graphql.dart';
import 'package:client/data/graphql/query/get_all_tasks.graphql.dart';
import 'package:client/data/models/task_model.dart';

class TaskRemoteDataProvider {
  final _artemisClient = ArtemisClient(dotenv.env['API_URL']!);

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

  Future<TaskModel?> createTask(String? newTask) async {
    try {
      final response = await _artemisClient.execute(
        CreateTaskMutation(
          variables: CreateTaskArguments(title: newTask!)
        )
      );

      if (response.hasErrors) {
        throw ErrorDescription('Error: ${response.errors?.first.message}');
      }

      final task = response.data?.addTask;

      return TaskModel.fromJson(task?.toJson());
    } catch (e) {
      debugPrint('$e');
    }

    return null;
  }
}