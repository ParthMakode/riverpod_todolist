import 'package:todolist/controller/providers.dart';
import 'package:todolist/controller/taskL.dart';
import 'package:todolist/model/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final tasklist = ref.watch(taskLProvider) ;

        return ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => Card(
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title: ${tasklist[index].task_title}',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Description: ${tasklist[index].task_desc}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  IconButton(
                    icon:const Icon(Icons.delete),

                    onPressed: () {
                      TaskLcontroller controller=ref.read(taskLProvider.notifier);
                      controller.deleteTask(tasklist[index]);},
                  )
                ],
              ),
            ),
          ),
          itemCount: tasklist.length,
        );
      },
    );
  }
}
