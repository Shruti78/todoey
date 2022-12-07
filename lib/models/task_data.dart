import 'package:flutter/material.dart';
import 'task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    // Task(name: 'buy milk'),
    // Task(name: 'buy egg'),
    //Task(name: 'buy coke'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task); // to add data to list
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners(); // to update the listenings
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
