import 'package:flutter/cupertino.dart';

import 'package:todo_app/Models/task.dart';
import 'package:todo_app/database/dbHelper.dart';

class Utils extends ChangeNotifier {
  Utils();

  late Future<List<Task>> tasksList;

  //Get all tasks
  Future<List<Task>> getAllTasks() {
    tasksList = DBHelper.instance.allTasks();
    notifyListeners();
    return tasksList;
  }

  //Check Task
  checkTask(Task task) {
    DBHelper.instance.checkTask(task);
    notifyListeners();
  }

  //Adding Task
  addTask(Task task) {
    DBHelper.instance.insertTask(task);
    notifyListeners();
  }

  //Deleting
  deleteTask(Task task) {
    DBHelper.instance.deleteTask(task);
    notifyListeners();
  }

  //Updateing
  updateTask(Task task) {
    DBHelper.instance.checkTask(task);
    notifyListeners();
  }
}
