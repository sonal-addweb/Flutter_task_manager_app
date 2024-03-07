import 'package:flutter_task_manager_app/src/data/models/task.dart';
import 'package:flutter_task_manager_app/src/domain/entities/task_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tTask = "test";
  final tTodoModel = TaskModel(id: 1, title: tTask);

  test("should be a subclass of Todo", () async {
    // assert
    expect(tTodoModel, isA<TaskEntity>());
  });

}
