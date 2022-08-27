import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/Models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallBack;

  const AddTaskScreen(this.addTaskCallBack);

  @override
  Widget build(BuildContext context) {
    String? taskTitle;
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
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (query) {
                taskTitle = query;
              },
              onEditingComplete: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(taskTitle!);
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(taskTitle!);
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
