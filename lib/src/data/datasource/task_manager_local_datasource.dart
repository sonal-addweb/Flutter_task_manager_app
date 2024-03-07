

import 'package:flutter_task_manager_app/src/data/datasource/local_data/database_helper.dart';
import 'package:flutter_task_manager_app/src/data/models/task.dart';

abstract class TaskManagerLocalDataSource{
  Future<List<TaskModel>> fetch();
  Future<TaskModel> add(TaskModel task);
  Future<List<TaskModel>> delete(int taskId);
  Future<int?> update(TaskModel task);

}

class TaskLocalDataSourceImpl implements TaskManagerLocalDataSource {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  @override
  Future<TaskModel> add(TaskModel task) => _databaseHelper.add(task);

  @override
  Future<List<TaskModel>> fetch() => _databaseHelper.fetch();

  @override
  Future<int?> update(TaskModel task) => _databaseHelper.update(task);

  @override
  Future<List<TaskModel>> delete(int taskId) => _databaseHelper.delete(taskId );

}