
import 'package:flutter_task_manager_app/src/data/datasource/task_manager_local_datasource.dart';
import 'package:flutter_task_manager_app/src/data/models/task.dart';
import 'package:flutter_task_manager_app/src/domain/failures/failures.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late TaskLocalDataSourceImpl taskLocalDataSourceImpl;
  setUp(() {
    taskLocalDataSourceImpl = TaskLocalDataSourceImpl();
  });

  group("getAllTask", () {
    test("should return all task list", () async {

      final List<TaskModel> todoModelList = [TaskModel(id: 1, title: 'task name')];
      // act
      final result = await taskLocalDataSourceImpl.fetch();
      // assert
      expect(result, todoModelList);
    });

    test(
        "should throw Database Exception when there is no todo exists",
        () async {
      // act
      final call = taskLocalDataSourceImpl.fetch;
      // assert
      expect(() => call(), throwsA(const DatabaseFailure("list is empty")));
    });
  });
}
