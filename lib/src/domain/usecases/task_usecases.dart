import 'package:dartz/dartz.dart';
import 'package:flutter_task_manager_app/src/domain/entities/task_entity.dart';
import 'package:flutter_task_manager_app/src/domain/failures/failures.dart';
import 'package:flutter_task_manager_app/src/domain/repositories/database_repository.dart';

class FetchTask {
  final DatabaseRepository repository;
  FetchTask(this.repository);
  Future<Either<Failure, List<TaskEntity>>> execute() =>
      repository.fetchTasks();
}

class AddTask {
  final DatabaseRepository repository;
  AddTask(this.repository);
  Future<Either<Failure, TaskEntity>> execute(TaskEntity task) =>
      repository.addTask(task);
}

class DeleteTask {
  final DatabaseRepository repository;
  DeleteTask(this.repository);
  Future<Either<Failure, List<TaskEntity>>> execute(TaskEntity task) =>
      repository.deleteTask(task);
}
