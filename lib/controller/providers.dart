import 'package:flutter_riverpod/flutter_riverpod.dart';
import'package:todolist/controller/taskL.dart';
import 'package:todolist/model/task.dart';
final appTitleProvider = Provider<String>(
    (ref)=>"riverpod todolist"
);

final taskLProvider = StateNotifierProvider <TaskLcontroller,List<Task>>((ref)=> TaskLcontroller([]));

