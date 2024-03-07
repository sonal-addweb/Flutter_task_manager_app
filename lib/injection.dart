import 'package:flutter_task_manager_app/src/data/datasource/task_manager_local_datasource.dart';
import 'package:flutter_task_manager_app/src/data/repositories/database_repository_impl.dart';
import 'package:flutter_task_manager_app/src/domain/repositories/database_repository.dart';
import 'package:flutter_task_manager_app/src/domain/usecases/task_usecases.dart';
import 'package:flutter_task_manager_app/src/presentation/bloc/task_bloc.dart';
import 'package:get_it/get_it.dart';


final locator = GetIt.instance;

Future<void> init() async {
  locator.registerFactory(() => TaskBloc(
        locator<FetchTask>(),
        locator<AddTask>(),
        locator<DeleteTask>(),
      ));

  locator.registerLazySingleton(() => FetchTask(locator()));
  locator.registerLazySingleton(() => AddTask(locator()));
  locator.registerLazySingleton(() => DeleteTask(locator()));

  locator.registerLazySingleton<DatabaseRepository>(
    () => DatabaseRepositoryImpl(taskManagerLocalDataSource: locator()),
  );

  locator.registerLazySingleton<TaskManagerLocalDataSource>(
    () => TaskLocalDataSourceImpl(),
  );
}
