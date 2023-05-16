import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/model/task.dart';
class TaskLcontroller extends StateNotifier<List<Task>>{
  TaskLcontroller(super.state);
  void addTask(Task task){
    state =[...state,task];
  }
  void deleteTask(Task task){
    print(state);
    state = state.where((_tasks) => (_tasks.task_title != task.task_title) ||(_tasks.task_desc != task.task_desc)).toList();
    // state.removeWhere((user)=>user.name!=user)
    print("after");
    print(state);

  }

}