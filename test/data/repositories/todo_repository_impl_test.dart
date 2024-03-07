import 'package:dartz/dartz.dart';
import 'package:flutter_task_manager_app/src/data/datasource/task_manager_local_datasource.dart';
import 'package:flutter_task_manager_app/src/data/models/task.dart';
import 'package:flutter_task_manager_app/src/data/repositories/database_repository_impl.dart';
import 'package:flutter_task_manager_app/src/domain/failures/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'todo_repository_impl_test.mocks.dart';

@GenerateMocks([TaskManagerLocalDataSource])
void main() {
  late MockTaskManagerLocalDataSource mockLocalDataSource;
  late DatabaseRepositoryImpl todoRepositoryImpl;
  setUp(() {
    mockLocalDataSource = MockTaskManagerLocalDataSource();
    todoRepositoryImpl =
        DatabaseRepositoryImpl(taskManagerLocalDataSource: mockLocalDataSource);
  });


  group("getAllTodo", () {
    final List<TaskModel> tAllTodoModel = [
      TaskModel(
        id: 1, title: 'task1',
      ),
      TaskModel(
        id: 2, title: 'task1',
      )
    ];
    test("should return list of todo when call to local database is successful",
        () async {
      // arrange
      when(mockLocalDataSource.fetch())
          .thenAnswer((realInvocation) async => tAllTodoModel);
      // act
      final result = await todoRepositoryImpl.fetchTasks();
      // assert
      expect(result, Right(tAllTodoModel));
    });

    test("should return Database failure when call to database is unsuccessful",
        () async {
      // arrange
      when(mockLocalDataSource.fetch()).thenThrow(const DatabaseFailure("database failure"));
      // act
      final result = await todoRepositoryImpl.fetchTasks();
      // assert
      verify(mockLocalDataSource.fetch());
      expect(result, const Left(DatabaseFailure("database failure")));
    });
  });

}
