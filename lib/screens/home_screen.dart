import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/cubits/cubit/cubit/fetch_tasks_cubit.dart';
import 'package:up_todo/models/task_model.dart';
import 'package:up_todo/widgets/task_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<FetchTasksCubit>().getUserTask();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchTasksCubit, FetchTasksState>(
      builder: (context, state) {
        if (state is FetchTasksSuccess) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: RefreshIndicator(
              color: Colors.white,
              backgroundColor: Colors.purple,
              onRefresh: () async =>
                  await context.read<FetchTasksCubit>().getUserTask(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                child: ListView.separated(
                    itemBuilder: (context, index) => TaskWidget(
                          title: state.tasks[index].title,
                          content: state.tasks[index].content,
                          onCheckBoxChanged: (isChecked) => setState(() {
                            if (isChecked) {
                              state.tasks.removeAt(index);
                            }
                          }),
                        ),
                    itemCount: state.tasks.length,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        )),
              ),
            ),
          );
        }
        if (state is FetchTasksLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return SizedBox();
      },
    );
  }
}
