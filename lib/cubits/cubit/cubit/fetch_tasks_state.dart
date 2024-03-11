part of 'fetch_tasks_cubit.dart';

@immutable
sealed class FetchTasksState {}

final class FetchTasksInitial extends FetchTasksState {}

final class FetchTasksSuccess extends FetchTasksState {
  final List<TaskModel> tasks;

  FetchTasksSuccess(this.tasks);
}

final class FetchTasksFailed extends FetchTasksState {
  String? error;
  FetchTasksFailed(this.error);
}

final class FetchTasksLoading extends FetchTasksState {}
