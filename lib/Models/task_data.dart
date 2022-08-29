import 'package:flutter/cupertino.dart';
import 'package:todo_app/Models/task.dart';

class TaskData with ChangeNotifier {
  List<Task> taskslist = [];

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

  int doneTasks() {
    int doneTasks = 0;
    for (var element in taskslist) {
      if (element.isDone != true) {
        doneTasks++;
      }
    }
    notifyListeners();
    return doneTasks;
  }

  int unDoneTasks() {
    int undoneTasks = 0;
    for (var element in taskslist) {
      if (element.isDone == true) {
        undoneTasks++;
      }
    }
    notifyListeners();
    return undoneTasks;
  }
}
