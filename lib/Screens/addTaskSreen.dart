import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/task.dart';

import 'package:todo_app/Models/utils.dart';

class AddTaskScreen extends StatefulWidget {
  final Function addTaskCallBack;

  const AddTaskScreen(this.addTaskCallBack);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _taskController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _taskController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Add task',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _taskController,
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                disabledBorder: InputBorder.none,
                labelText: "Task",
                hintText: "What are you going to do ?",
              ),
              onEditingComplete: () async {
                Task task = Task(
                  title: _taskController.text,
                );
                Provider.of<Utils>(context, listen: false).addTask(task);

                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () async {
                Task task = Task(title: _taskController.text);

                Provider.of<Utils>(context, listen: false).addTask(task);

                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.teal[400], primary: Colors.white),
              child: const Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}
