import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTilte;
  final void Function(bool?) checkBoxChange;
  final void Function() longPressAction;

  const TaskTile(
      {required this.taskTilte,
      required this.isChecked,
      required this.checkBoxChange,
      required this.longPressAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: CheckboxListTile(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          value: isChecked,
          title: Text(
            taskTilte,
            style: TextStyle(
                decoration: isChecked ? TextDecoration.lineThrough : null,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                wordSpacing: 2,
                fontSize: 15),
          ),
          onChanged: checkBoxChange,
        ),
      ),
    );
  }
}
