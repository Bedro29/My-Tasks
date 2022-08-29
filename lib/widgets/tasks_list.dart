import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Models/task.dart';
import 'package:todo_app/Models/task_data.dart';
import 'package:todo_app/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class tasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Task> tasks = Provider.of<TaskData>(context).taskslist;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Consumer<TaskData>(builder: ((context, tasksData, child) {
      return tasks.isNotEmpty
          ? ListView.builder(
              itemCount: tasksData.taskslist.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: const Key('value'),
                  direction: DismissDirection.endToStart,
                  onDismissed: ((direction) {
                    tasksData.deleteTask(tasksData.taskslist[index]);
                  }),
                  child: TaskTile(
                    taskTilte: tasksData.taskslist[index].name,
                    isChecked: tasksData.taskslist[index].isDone,
                    checkBoxChange: (value) {
                      tasksData.updateTask(tasksData.taskslist[index]);
                    },
                    longPressAction: () {
                      tasksData.deleteTask(tasksData.taskslist[index]);
                    },
                  ),
                );
              })
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 20, right: 20),
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(20),
                          dashPattern: const [10, 10],
                          color: Colors.black54,
                          strokeWidth: 2,
                          child: SizedBox(
                            width: width * 0.8,
                            height: height * 0.1,
                            child: const Center(
                              child: Text(
                                "No Tasks for today",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54,
                                    letterSpacing: 1.2),
                              ),
                            ),
                          ),
                        ))),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
    }));
  }
}
