part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {}

class FetchTasks extends TaskEvent {
  @override
  List<Object> get props => [];
}

class FetchTasksAfterAddingEvent extends TaskEvent {
  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TaskEvent {
  final TaskEntity task;

  AddTaskEvent(this.task);

  @override
  List<Object?> get props => [task];
}

class UpdateTaskEvent extends TaskEvent {
  final TaskEntity task;

  UpdateTaskEvent(this.task);

  @override
  List<Object?> get props => [task];
}

class DeleteTaskEvent extends TaskEvent {
  final TaskEntity task;

  DeleteTaskEvent(this.task);

  @override
  List<Object?> get props => [task];
}