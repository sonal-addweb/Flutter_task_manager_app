
import 'package:dartz/dartz.dart';
import 'package:flutter_task_manager_app/src/domain/entities/task_entity.dart';
import 'package:flutter_task_manager_app/src/domain/failures/failures.dart';

abstract class DatabaseRepository {
  Future<Either<Failure, TaskEntity>> addTask(TaskEntity task);
  Future<Either<Failure, List<TaskEntity>>> deleteTask(TaskEntity task);
  Future<Either<Failure, List<TaskEntity>>> fetchTasks();
}