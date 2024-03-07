import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_manager_app/src/domain/entities/task_entity.dart';

import '../../domain/usecases/task_usecases.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final FetchTask fetchTasks;
  final AddTask addTasks;
  final DeleteTask deleteTasks;

  TaskBloc(this.fetchTasks, this.addTasks , this.deleteTasks) : super(TaskEmptyState()) {
    on<FetchTasks>(fetchTask);
    on<AddTaskEvent>(addTask);
    on<DeleteTaskEvent>(deleteTask);
    on<FetchTasksAfterAddingEvent>(fetchTasksAfterAdding);
  }

  FutureOr<void> fetchTask(event, emit) async {
    // emit(LoadingTasksState());

    try {
      final result = await fetchTasks.execute();

      result.fold(
            (failure) => emit(TaskErrorState(failure.message)),
            (tasks) {
          if (tasks.isEmpty) {
            emit(TaskEmptyState());
          } else {
            emit(TaskLoadedState(tasks));
          }
        },
      );
    } catch (e) {
      emit(TaskErrorState('Error loading tasks: $e'));
    }
  }

  Future<void> fetchTasksAfterAdding(event, emit) async {
    try {
      final result = await fetchTasks.execute();

      result.fold(
            (failure) => emit(TaskErrorState(failure.message)),
            (tasks) {
          if (tasks.isEmpty) {
            emit(TaskEmptyState());
          } else {
            emit(LoadedTaskAfterAddingState(tasks));
          }
        },
      );
    } catch (e) {
      emit(TaskErrorState('Error loading tasks: $e'));
    }
  }

  Future<void> addTask(event, emit) async {
    try {
      final result = await addTasks.execute(event.task);

      result.fold(
            (failure) => emit(TaskErrorState(failure.message)),
            (task) => add(FetchTasksAfterAddingEvent()),
      );
    } catch (e) {
      emit(TaskErrorState('Failed to add the task to the database: $e'));
    }
  }

  Future<void> deleteTask(event, emit) async {
    try {
      final result = await deleteTasks.execute(event.task);

      result.fold(
            (failure) => emit(TaskErrorState(failure.message)),
            (tasks) {
          if (tasks.isEmpty) {
            emit(TaskEmptyState());
          } else {
            emit(LoadedTaskAfterAddingState(tasks));
          }
        },
      );
    } catch (e) {
      emit(TaskErrorState('Failed to add the task to the database: $e'));
    }
  }
}
