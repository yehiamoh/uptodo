import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:up_todo/cubits/cubit/add_task_cubit.dart';
import 'package:up_todo/models/task_model.dart';

part 'fetch_tasks_state.dart';

class FetchTasksCubit extends Cubit<FetchTasksState> {
  FetchTasksCubit() : super(FetchTasksInitial());
  bool? isCheckBoxActive;
  Future getUserTask() async {
    try {
      emit(FetchTasksLoading());
      final allFetchedTasks = await FirebaseFirestore.instance
          .collection('tasks')
          .where('author', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      final List<TaskModel> userTask = [];
      for (var task in allFetchedTasks.docs) {
        userTask.add(TaskModel.fromJson(task.data()));
      }
      emit(FetchTasksSuccess(userTask));

      /* if (isCheckBoxActive == true) {
        userTask.remove();
      }*/
    } catch (e) {
      emit(FetchTasksFailed(e.toString()));
    }
  }
}
