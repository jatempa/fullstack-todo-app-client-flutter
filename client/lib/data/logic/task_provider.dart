import 'package:client/domain/entities/task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:client/data/data_sources/task_remote_data_provider.dart';
import 'package:client/data/logic/task_state_notifier.dart';
import 'package:client/data/repositories/task_repository.dart';

///Data Provider
final _taskRemoteDataProvider = Provider<TaskRemoteDataProvider>(
  (ref) => TaskRemoteDataProvider()
);

///Repository
final taskRepositoryProvider = Provider<TaskRepository>(
  (ref) => TaskRepository(
    remoteDataProvider: ref.watch(_taskRemoteDataProvider)
  )
);

///Logic / StateNotifier
final taskControllerProvider = AsyncNotifierProvider.autoDispose<TaskController, List<Task>?>(
  () => TaskController()
);
