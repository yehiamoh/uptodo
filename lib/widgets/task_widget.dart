// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaskWidget extends StatefulWidget {
  final String? title;
  final String? content;
  final Function? onCheckBoxChanged;
  const TaskWidget(
      {super.key,
      required this.title,
      required this.content,
      required this.onCheckBoxChanged});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool? checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff363636),
      child: ListTile(
        hoverColor: Colors.grey,
        leading: Checkbox(
            value: checkBoxValue,
            onChanged: (bool? value) {
              setState(() {
                checkBoxValue = value!;
                widget.onCheckBoxChanged!(checkBoxValue);
              });
            }),
        title: Text(
          widget.title!,
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.normal),
        ),
        subtitle: Text(
          widget.content!,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
