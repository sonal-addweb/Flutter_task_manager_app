import 'package:dartz/dartz.dart';
import 'package:flutter_task_manager_app/src/data/datasource/task_manager_local_datasource.dart';
import 'package:flutter_task_manager_app/src/data/models/task.dart';
import 'package:flutter_task_manager_app/src/domain/entities/task_entity.dart';
import 'package:flutter_task_manager_app/src/domain/failures/failures.dart';

import '../../domain/exceptions/exceptions.dart';
import '../../domain/repositories/database_repository.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  final TaskManagerLocalDataSource taskManagerLocalDataSource;


  DatabaseRepositoryImpl({required this.taskManagerLocalDataSource});

  @override
  Future<Either<Failure, TaskEntity>> addTask(TaskEntity taskEntity) async{
    try {
      final taskToInsert = TaskModel.fromEntity(taskEntity);
      await taskManagerLocalDataSource.add(taskToInsert);
      return Right(taskEntity);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> fetchTasks() async{
    try {
      final tasks = await taskManagerLocalDataSource.fetch();
      return Right(tasks.map((task) => task.toEntity()).toList());
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure,List<TaskEntity>>> deleteTask(TaskEntity task) async{
    try {
      final tasks = await taskManagerLocalDataSource.delete(task.id);
      return Right(tasks.map((task) => task.toEntity()).toList());
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }
}