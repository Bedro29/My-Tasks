import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/task.dart';
import 'package:todo_app/Models/utils.dart';

class TasksStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Consumer<Utils>(builder: (context, util, child) {
      return FutureBuilder(
          future: util.getAllTasks(),
          builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                int allTasks = snapshot.data!.length;
                int doneTasks = 0;
                for (Task task in snapshot.data!) {
                  if (task.isDone == true) {
                    doneTasks++;
                  }
                }
                double percent = doneTasks / allTasks;
                return Container(
                  width: width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: SizedBox(
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  allTasks - doneTasks == 0
                                      ? 'No remaining \ntasks !'
                                      : allTasks - doneTasks == 1
                                          ? "Only ${(allTasks - doneTasks)} \nremaining task !"
                                          : "${allTasks - doneTasks} remaining \ntasks ! ",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            FittedBox(
                              child: CircularPercentIndicator(
                                radius: 48,
                                lineWidth: 12,
                                percent: percent,
                                center: Text(
                                  allTasks == 0
                                      ? ''
                                      : '${(percent * 100).roundToDouble().toInt()}% \n   Done !',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                progressColor: Colors.black87,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Container(
                  width: width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: SizedBox(
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const FittedBox(
                              child: Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  'No tasks for today !',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            FittedBox(
                              child: CircularPercentIndicator(
                                radius: 48,
                                lineWidth: 12,
                                center: const Text(
                                  '',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                progressColor: Colors.black87,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
            } else {
              return const Text('Sorry, we have a problem !');
            }
          });
    });
  }
}
