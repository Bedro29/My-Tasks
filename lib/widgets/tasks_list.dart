import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Models/task.dart';
import 'package:todo_app/Models/utils.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/task_tile.dart';

class tasksList extends StatefulWidget {
  @override
  State<tasksList> createState() => _tasksListState();
}

class _tasksListState extends State<tasksList> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Consumer<Utils>(builder: (context, util, child) {
      return FutureBuilder<List<Task>>(
          future: util.getAllTasks(),
          builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
            if (snapshot.data == null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 20, right: 20),
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
            } else {
              List<Task> tasksList = snapshot.data as List<Task>;
              return ListView.builder(
                  itemCount: tasksList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onLongPress: (() => util.deleteTask(tasksList[index])),
                      child: TaskTile(
                        taskTilte: tasksList[index].title,
                        isChecked: tasksList[index].isDone,
                        checkBoxChange: (value) {
                          util.updateTask(tasksList[index]);
                        },
                      ),
                    );
                  });
            }
          });
    });
  }
}
