import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todoapp/bloc/todo_bloc.dart';
import 'package:todoapp/constants/app_constants.dart';
import 'package:todoapp/model/task.dart';
import 'package:todoapp/config/route.dart';

class EditTaskScreen extends StatefulWidget {
  final Task task;
  const EditTaskScreen({Key? key, required this.task}) : super(key: key);

  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    final _nav = locator<NavigationService>();
    TextEditingController titleController =
        TextEditingController(text: widget.task.title);
    TextEditingController descriptionController =
        TextEditingController(text: widget.task.description);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Task Details',
            style: _theme.textTheme.headline1,
          ),
          automaticallyImplyLeading: true,
          leading: InkWell(
              onTap: () => _nav.goback(),
              child: SvgPicture.asset(
                'assets/svgs/arrow_back.svg',
                height: 18.67,
                width: 21.33,
                fit: BoxFit.scaleDown,
              )),
          actions: [
            InkWell(
              onTap: () {
                context
                    .read<TodoBloc>()
                    .add(TodoDeleteTaskEvent(id: widget.task.id));
              },
              child: SvgPicture.asset(
                'assets/svgs/delete.svg',
                height: 24,
                width: 24,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 13)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 19),
          child: Form(
            key: _formkey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Text('Title', style: _theme.textTheme.bodyText2),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: titleController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'What do you want to do?',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text('Description', style: _theme.textTheme.bodyText2),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: descriptionController,
                  minLines: 4,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Description of Task',
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 48,
                  child: BlocBuilder<TodoBloc, TodoState>(
                    builder: (context, state) {
                      if (state is TodoLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: kprimaryColor,
                          ),
                        );
                      }
                      return ElevatedButton(
                          onPressed: () => context.read<TodoBloc>().add(
                              TodoUpdateTaskEvent(
                                  task: widget.task.copyWith(
                                      title: titleController.text,
                                      description:
                                          descriptionController.text))),
                          child: Text('Save', style: _theme.textTheme.button));
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
