import 'package:todolist/model/task.dart';
import 'package:todolist/widget/task_list.dart';
import 'package:flutter/material.dart';

class TaskListScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title:const Text(
          'Tasks',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        child: TaskList(),
        padding: EdgeInsets.all(8),
      ),
    );
  }
}
