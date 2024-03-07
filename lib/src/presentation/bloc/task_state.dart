
part of 'task_bloc.dart';



abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskEmptyState extends TaskState {}

class FetchTaskState extends TaskState {
  final List<TaskEntity> tasks;

  const FetchTaskState({required this.tasks});
  @override
  List<Object> get props => [];
}

class AddTaskState extends TaskState {
  final TaskEntity task;

  const AddTaskState(this.task);

  @override
  List<Object> get props => [task];
}

class LoadingTaskState extends TaskState {}

class LoadedTaskAfterAddingState extends TaskState {
  final List<TaskEntity> tasks;

  const LoadedTaskAfterAddingState(this.tasks);

  @override
  List<Object> get props => [tasks];
}

class TaskLoadedState extends TaskState {
  final List<TaskEntity> tasks;

  const TaskLoadedState(this.tasks);

  @override
  List<Object> get props => [tasks];
}

class TaskErrorState extends TaskState {
  final String message;

  const TaskErrorState(this.message);

  @override
  List<Object> get props => [message];
}
