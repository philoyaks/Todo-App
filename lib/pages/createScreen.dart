import 'package:flutter/material.dart';

class CreateOrEditTask extends StatefulWidget {
  const CreateOrEditTask({Key? key}) : super(key: key);

  @override
  _CreateOrEditTaskState createState() => _CreateOrEditTaskState();
}

class _CreateOrEditTaskState extends State<CreateOrEditTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Task'),
      ),
    );
  }
}
