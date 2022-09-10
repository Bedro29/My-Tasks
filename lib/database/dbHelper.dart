import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_app/Models/task.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper instance = DBHelper._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDB();
    return _database!;
  }

  static const tableTasks = """
    CREATE TABLE tasks 
    (
      title TEXT PRIMARY KEY,
      done INTEGER
    );""";

  initDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    return await openDatabase(join(await getDatabasesPath(), 'mytasks.db'),
        version: 1, onCreate: (db, version) async {
      await db.execute(tableTasks);
    });
  }

  //INSERT TASK
  void insertTask(Task task) async {
    final Database db = await database;
    await db.insert('tasks', task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

//UPDATE TASK
  void updateTask(Task task) async {
    final Database db = await database;
    await db.update("tasks", task.toMap(),
        where: "title = ?", whereArgs: [task.title]);
  }

  void checkTask(Task task) async {
    final Database db = await database;

    if (task.isDone == false) {
      // set to true, true == 1
      int one = 1;
      await db.rawUpdate("Update tasks SET done = ? WHERE title = ? ",
          [one.toString(), task.title.toString()]);
    } else {
      //set to false, false == 0
      int zero = 0;
      await db.rawUpdate("Update tasks SET done = ? WHERE title = ? ",
          [zero.toString(), task.title.toString()]);
    }
    // await db.rawUpdate("Update tasks SET done = ? WHERE title = ? ", [0,task.title]);
  }

//DELETE TASK
  void deleteTask(Task task) async {
    final Database db = await database;
    await db.delete("tasks", where: "title = ?", whereArgs: [task.title]);
  }

  // GET ALL
  Future<List<Task>> allTasks() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    List<Task> tasks = List.generate(maps.length, (i) {
      return Task.fromMap(maps[i]);
    });
    return tasks;
  }

  Future<List> getTask(String title) async {
    final Database db = await database;
    var task = await db.query('tasks', where: 'title = "$title"');
    return task;
  }

  Future<bool?> getDoneTask(Task task) async {
    bool? done;
    getTask(task.title).then((value) => () {
          // return value[0]['done'] == 0 ? false : true ;

          if (value[0]['done'] == 0) {
            done = false;
          } else {
            done = true;
          }
        });
    return done;
  }
}
