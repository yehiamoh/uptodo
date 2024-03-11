// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/cubits/cubit/add_task_cubit.dart';

class TaskInfoSheet extends StatelessWidget {
  const TaskInfoSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskCubit, AddTaskState>(
      builder: (context, state) {
        final titleController = TextEditingController();
        final contentController = TextEditingController();
        final taskCubit = BlocProvider.of<AddTaskCubit>(context);
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
          child: Container(
            color: Color(0xff363636),
            width: MediaQuery.of(context).size.width,
            child: state is AddTaskLoading
                ? CircularProgressIndicator()
                : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Add Task",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      TextField(
                        style: TextStyle(color: Colors.white),
                        controller: taskCubit.titleController,
                        decoration: InputDecoration(
                            hintText: 'title',
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 13)),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      TextField(
                        style: TextStyle(color: Colors.white),
                        controller: taskCubit.contentController,
                        decoration: InputDecoration(
                            hintText: 'content',
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 13)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    taskCubit.addTask(context);
                                  },
                                  icon: Icon(
                                    Icons.done_outline_rounded,
                                    size: 27,
                                    color: Colors.white,
                                  )),
                              Text(
                                "Done",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 200,
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    size: 27,
                                    color: Colors.red,
                                  )),
                              Text(
                                "Exit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        );
        return SizedBox();
      },
    );
  }
}
