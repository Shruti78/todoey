import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String tasktitle;
  final dynamic checkboxCallback;
  final dynamic longPressCallback;

  TaskTile(
      {required this.isChecked,
      required this.tasktitle,
      required this.checkboxCallback,
      required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        tasktitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      leading: Checkbox(
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      trailing: MaterialButton(
          onPressed: longPressCallback,
          child: const Icon(
            Icons.delete,
            color: Colors.grey,
          )),
    );
  }
}
