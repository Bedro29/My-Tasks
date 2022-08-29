import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/task_data.dart';

class TasksStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Consumer<TaskData>(builder: (context, taskdata, child) {
              int donetasks = taskdata.doneTasks();

              return Text(
                donetasks == 0
                    ? 'No remaining tasks !'
                    : donetasks == 1
                        ? "Only $donetasks remaining task !"
                        : "$donetasks remaining tasks ",
                style: const TextStyle(fontSize: 20),
              );
            }),
            Consumer<TaskData>(
              builder: ((context, tasksdata, child) {
                int undonetasks = tasksdata.unDoneTasks();

                double percent =
                    ((undonetasks * 100) / tasksdata.taskslist.length) / 100;
                return Container(
                  child: CircularPercentIndicator(
                    radius: 50,
                    lineWidth: 12,
                    percent: tasksdata.taskslist.isEmpty ? 0 : percent,
                    center: Text(
                      tasksdata.taskslist.isEmpty
                          ? ''
                          : '${(percent * 100).roundToDouble()}% Done !',
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    progressColor: Colors.black87,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
