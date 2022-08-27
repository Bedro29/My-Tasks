import 'package:flutter/cupertino.dart';
import 'package:todo_app/widgets/Models/task.dart';

class TaskData with ChangeNotifier {
  List<Task> taskslist = [
    Task(name: 'Go to school'),
    Task(name: 'Be happy'),
    Task(name: 'programming')
  ];

  void addTask(String newTaskTitle) {
    taskslist.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.doneChange();
    notifyListeners();
  }

  void deleteTask(Task task) {
    taskslist.remove(task);
    notifyListeners();
  }
}
