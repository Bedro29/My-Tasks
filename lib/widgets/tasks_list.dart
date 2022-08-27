import 'package:flutter/material.dart';
import 'package:todo_app/widgets/Models/task_data.dart';
import 'package:todo_app/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class tasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: ((context, tasksData, child) {
      return ListView.builder(
        itemCount: tasksData.taskslist.length,
        itemBuilder: (BuildContext context, int index) {
          return TaskTile(
            taskTilte: tasksData.taskslist[index].name,
            isChecked: tasksData.taskslist[index].isDone,
            checkBoxChange: (value) {
              tasksData.updateTask(tasksData.taskslist[index]);
            },
            longPressAction: () {
              tasksData.deleteTask(tasksData.taskslist[index]);
            },
          );
        },
      );
    }));
  }
}
