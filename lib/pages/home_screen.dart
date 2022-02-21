import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/bloc/todo_bloc.dart';
import 'package:todoapp/data/repository.dart';
import 'package:todoapp/widgets/todo_list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool check = true;

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    final bloc = BlocProvider.of<TodoBloc>(context);
    Repository getIT = Repository();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo List',
          style: _theme.textTheme.headline1,
        ),
      ),
      body: ListView(
        children: [
          TodoListTiles(
            done: true,
            message: 'You are welcom',
            title: 'Bayo is good',
          ),
          ElevatedButton(onPressed: () async {}, child: const Text('sdfjfn'))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }

  SizedBox emptyTodo(ThemeData _theme) {
    return SizedBox(
      width: double.infinity,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Todo List is empty',
              style: _theme.textTheme.bodyText1!
                  .copyWith(fontFamily: 'Circular Std'),
            ),
            const SizedBox(height: 10),
            Text(
              'Create a task',
              style: _theme.textTheme.subtitle1!
                  .copyWith(fontFamily: 'Circular Std'),
            )
          ]),
    );
  }
}
