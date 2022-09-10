class Task {
  String title;
  bool isDone;

  Task({required this.title, this.isDone = false});

  void doneChange() {
    isDone = !isDone;
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'done': isDone == true ? 1 : 0,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) => Task(
        title: map['title'],
        isDone: map['done'] == 1,
      );

  String showTask() {
    return '''
    The task : ===============================
    Title = $title 
    Done = $isDone 
    ''';
  }
}
