import 'package:todolist/model/task.dart';
import 'package:todolist/screens/task_list_screen.dart';
import 'package:todolist/widget/button.dart';
import 'package:todolist/widget/textinput.dart';
import 'package:todolist/widget/task_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/controller/providers.dart';
import 'package:todolist/controller/taskL.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String? _t_title;
  String? _t_desc;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9BA4B5),
      appBar: AppBar(
        title: Consumer(builder: (context, ref, child) {
          return Center(
            child: Text(
              ref.read(appTitleProvider),
              style: TextStyle(color: Colors.white),
            ),
          );
        }),

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 16),
              TextInput(
                labelText: 'Task Title',
                onSaved: (String? value) {
                  _t_title = value;
                },
              ),
              const SizedBox(height: 16),
              TextInput(
                labelText: 'Task Description',
                onSaved: (String? value) {
                  _t_desc = value;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer(
                    builder: (context, ref, _) {
                      final TaskLcontroller controller =
                          ref.read(taskLProvider.notifier);
                      return AddButton(
                        text: 'Add',
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) return;

                          _formKey.currentState!.save();

                          controller.addTask(Task(_t_title, _t_desc));
                        },
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                  AddButton(
                    text: 'List',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TaskListScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TaskList(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
