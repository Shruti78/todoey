import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_dolist/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskdata.tasks[index];
            return TaskTile(
              tasktitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                //  tasks[index].toggleDone();

                taskdata.updateTask(task);
              },
              longPressCallback: () {
                taskdata.deleteTask(task);
              },
            );
          },
          itemCount: taskdata.taskCount,
        );
      },
    );
  }
}
