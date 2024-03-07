import 'package:dartz/dartz.dart';
import 'package:flutter_task_manager_app/src/domain/entities/task_entity.dart';
import 'package:flutter_task_manager_app/src/domain/repositories/database_repository.dart';
import 'package:flutter_task_manager_app/src/domain/usecases/task_usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_todo_test.mocks.dart';

@GenerateMocks([DatabaseRepository])
void main() {
  late MockDatabaseRepository mockTodoRepository;
  late FetchTask getAllTodo;
  setUp(() {
    mockTodoRepository = MockDatabaseRepository();
    getAllTodo = FetchTask(mockTodoRepository);
  });

  final List<TaskEntity> tAllTodo = [
    const TaskEntity(
      id: 1,
      title: 'task1',
    ),
    const TaskEntity(
      id: 2,
      title: 'task2',
    )
  ];

  test("should get all todo from the repository", () async {
    // arrange
    when(mockTodoRepository.fetchTasks())
        .thenAnswer((_) async => Right(tAllTodo));
    // act
    final result =  getAllTodo;
    // assert
    expect(result, Right(tAllTodo));
    verify(mockTodoRepository.fetchTasks());
    verifyNoMoreInteractions(mockTodoRepository);
  });
}
