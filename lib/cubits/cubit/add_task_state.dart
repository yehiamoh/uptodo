part of 'add_task_cubit.dart';

@immutable
sealed class AddTaskState {}

final class AddTaskInitial extends AddTaskState {}

final class AddTaskSuccess extends AddTaskState {}

final class AddTaskLoading extends AddTaskState {}

final class AddTaskFail extends AddTaskState {
  String? error;
  AddTaskFail(this.error);
}
