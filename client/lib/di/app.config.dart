// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:client/data/data_sources/TaskRemoteDataProvider.dart' as _i3;
import 'package:client/data/repositories/TaskRepository.dart' as _i5;
import 'package:client/domain/interfaces/ITaskRepository.dart' as _i4;
import 'package:client/domain/services/TaskService.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.TaskRemoteDataProvider>(
      () => _i3.TaskRemoteDataProvider());
  gh.lazySingleton<_i4.ITaskRepository>(() =>
      _i5.TaskRepository(remoteDataProvider: gh<_i3.TaskRemoteDataProvider>()));
  gh.lazySingleton<_i6.TaskService>(
      () => _i6.TaskService(repository: gh<_i4.ITaskRepository>()));
  return getIt;
}
