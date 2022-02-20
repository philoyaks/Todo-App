import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateOrEditTaskScreen extends StatefulWidget {
  final bool createTask;
  const CreateOrEditTaskScreen({Key? key, this.createTask = false})
      : super(key: key);

  @override
  _CreateOrEditTaskScreenState createState() => _CreateOrEditTaskScreenState();
}

class _CreateOrEditTaskScreenState extends State<CreateOrEditTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);

    return Scaffold(
      appBar: widget.createTask
          ? AppBar(
              title: Text(
                'Create Task',
                style: _theme.textTheme.headline1,
              ),
              leading: SizedBox(
                height: 10,
                width: 10,
                child: SvgPicture.asset(
                  'assets/svgs/arrow_back.svg',
                  height: 18.67,
                  width: 21.33,
                  fit: BoxFit.scaleDown,
                ),
              ))
          : AppBar(
              title: Text(
                'Task Details',
                style: _theme.textTheme.headline1,
              ),
              automaticallyImplyLeading: true,
              leading: InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/svgs/arrow_back.svg',
                    height: 18.67,
                    width: 21.33,
                    fit: BoxFit.scaleDown,
                  )),
              actions: [
                InkWell(
                  onTap: () {},
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
              children: [
                Text('Title', style: _theme.textTheme.bodyText2),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: titleController,
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
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Save', style: _theme.textTheme.button)),
                )
              ],
            )),
      ),
    );
  }
}
