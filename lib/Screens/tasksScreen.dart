import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Screens/addTasksreen.dart';
import 'package:todo_app/widgets/tasks_list.dart';
import 'package:todo_app/widgets/tasks_stats.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SizedBox(
                child: SingleChildScrollView(
                    child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskScreen((taskTitle) {}),
                )),
              ),
            );
          },
          backgroundColor: Colors.indigo[400],
          child: const Icon(CupertinoIcons.add),
        ),
        backgroundColor: Colors.teal[400],
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
            child: Center(
              child: SizedBox(
                height: height,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          width: 10,
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
                    const SizedBox(
                      height: 20,
                    ),
                    TasksStats(),
                    const SizedBox(height: 20),
                    Expanded(
                        child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        child: tasksList(),
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
        )));
  }
}
