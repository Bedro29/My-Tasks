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
    return ListTile(
      title: Text(
        taskTilte,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.teal[400],
        value: isChecked,
        onChanged: checkBoxChange,
      ),
      onLongPress: longPressAction,
    );
  }
}
