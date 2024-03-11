import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  Future addTask(BuildContext context) async {
    try {
      emit(AddTaskLoading());
      await FirebaseFirestore.instance.collection('tasks').add({
        'author': FirebaseAuth.instance.currentUser!.uid,
        'title': titleController.text,
        'content': contentController.text,
        'time': DateTime.now().toString(),
      });

      titleController.clear();
      contentController.clear();
      emit(AddTaskSuccess());
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("task added successfuly"),
        backgroundColor: Colors.green,
      ));
    } catch (e) {
      emit(AddTaskFail(e.toString()));
    }
  }
}
