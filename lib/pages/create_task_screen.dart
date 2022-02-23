import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todoapp/bloc/todo_bloc.dart';
import 'package:todoapp/constants/app_constants.dart';
import 'package:todoapp/config/route.dart';

class CreateTaskScreen extends StatefulWidget {
  final bool createTask;
  const CreateTaskScreen({Key? key, this.createTask = false}) : super(key: key);

  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    final _nav = locator<NavigationService>();

    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Create Task',
            style: _theme.textTheme.headline1,
          ),
          leading: InkWell(
            onTap: () => _nav.goback(),
            child: SvgPicture.asset(
              'assets/svgs/arrow_back.svg',
              height: 18.67,
              width: 21.33,
              fit: BoxFit.scaleDown,
            ),
          )),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  minLines: 4,
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
                  child: BlocConsumer<TodoBloc, TodoState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is TodoLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: kprimaryColor,
                            ),
                          );
                        }
                        return ElevatedButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                context.read<TodoBloc>().add(
                                    TodoInsertTaskEvent(
                                        title: titleController.text,
                                        description:
                                            descriptionController.text));
                              }
                            },
                            child:
                                Text('Save', style: _theme.textTheme.button));
                      }),
                )
              ],
            )),
      ),
    );
  }
}
