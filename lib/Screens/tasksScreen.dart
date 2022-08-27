import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Screens/addTasksreen.dart';
import 'package:todo_app/widgets/Models/task.dart';
import 'package:todo_app/widgets/Models/task_data.dart';
import 'package:todo_app/widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                  child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen((taskTitle) {
                  // setState(() {
                  //   taskslist.add(Task(name: taskTitle));
                  //   Navigator.pop(context);
                  // });
                }),
              )),
            );
          },
          backgroundColor: Colors.indigo[400],
          child: const Icon(CupertinoIcons.add),
        ),
        backgroundColor: Colors.teal[400],
        body: SafeArea(
            child: Padding(
          padding:
              const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.playlist_add_check_circle,
                      size: 50,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    FittedBox(
                      child: Text(
                        'To DO today',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Text(
                  "${Provider.of<TaskData>(context).taskslist.length} remaining tasks !",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                Expanded(
                    child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    child: tasksList(),
                  ),
                ))
              ],
            ),
          ),
        )));
  }
}
