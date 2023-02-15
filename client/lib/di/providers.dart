import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:client/data/data_sources/TaskRemoteDataProvider.dart';
import 'package:client/data/repositories/TaskRepository.dart';
import 'package:client/domain/entities/Task.dart';
import 'package:client/domain/services/TaskService.dart';

final taskRemoteDataProvider = Provider<TaskRemoteDataProvider>((ref) {
  return TaskRemoteDataProvider();
});

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final dataProvider = ref.watch(taskRemoteDataProvider);
  return TaskRepository(remoteDataProvider: dataProvider);
});

final taskServiceProvider = Provider<TaskService>((ref) {
  final repositoryProvider = ref.watch(taskRepositoryProvider);
  return TaskService(repository: repositoryProvider);
});

final tasksProvider = FutureProvider<List<Task>?>((ref) {
  final serviceProvider = ref.watch(taskServiceProvider);
  return serviceProvider.fetchAll();
});