part of 'task_cubit.dart';

abstract class TaskState extends Equatable {
  const TaskState();
}

class TaskInitial extends TaskState {
  @override
  List<Object> get props => [];
}

class TaskLoaded extends TaskState {
  final QuerySnapshot querySnapshot;

  TaskLoaded(this.querySnapshot);

  @override
  List<Object> get props => [querySnapshot];
}

class TaskLoading extends TaskState {
  @override
  List<Object> get props => [];
}
class TaskLoadError extends TaskState {
  final String errorMessage;

  TaskLoadError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}