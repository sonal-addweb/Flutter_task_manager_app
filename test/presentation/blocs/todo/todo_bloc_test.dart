import 'package:dartz/dartz.dart';
import 'package:flutter_task_manager_app/src/domain/entities/task_entity.dart';
import 'package:flutter_task_manager_app/src/domain/usecases/task_usecases.dart';
import 'package:flutter_task_manager_app/src/presentation/bloc/task_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'todo_bloc_test.mocks.dart';

@GenerateMocks([FetchTask, AddTask, DeleteTask])
void main() {
  late TaskBloc taskBloc;
  late MockFetchTask mockGetAllTodo;
  late MockAddTask mockAddTask;
  late MockDeleteTask mockDeleteTask;
  setUp(() {
    mockGetAllTodo = MockFetchTask();
    mockAddTask = MockAddTask();
    mockDeleteTask = MockDeleteTask();
    taskBloc = TaskBloc(mockGetAllTodo, mockAddTask, mockDeleteTask);
  });

  test("initial state should be TodoInitialState", () async {
    // assert
    expect(taskBloc.state, equals(TaskEmptyState()));
  });

  group("GetTodoListEvent", () {
    final List<TaskEntity> allTodo = [
      const TaskEntity(id: 1, title: 'task1'),
      const TaskEntity(id: 2, title: 'task2'),
    ];

    test(
      'should get todo from the getAllTodo use case',
      () async {
        // arrange

        when(mockGetAllTodo.execute()).thenAnswer((_) async => Right(allTodo));

        // act
        taskBloc.add(FetchTasks());
        // assert
        verify(mockGetAllTodo);
      },
    );

    test(
      'should emit [TodoLoadingState, TodoLoadSuccessState] when data is gotten successfully',
      () async {
        // arrange
        when(mockGetAllTodo.execute()).thenAnswer((_) async => Right(allTodo));
        // assert later
        final expected = [
          TaskLoadedState(allTodo),
        ];
        expectLater(taskBloc.stream, emitsInOrder(expected));
        // act
        taskBloc.add(FetchTasks());
      },
    );
  });
}
