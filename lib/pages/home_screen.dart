import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/bloc/todo_bloc.dart';
import 'package:todoapp/constants/app_constants.dart';
import 'package:todoapp/widgets/todo_list_tile.dart';

import '../route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool check = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<TodoBloc>().add(TodoGetAllTaskEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    final NavigationService _nav = locator<NavigationService>();
    var _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo List',
          style: _theme.textTheme.headline1,
        ),
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
        height: _size.height,
        width: _size.width,
        child: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state is TodoLoadSucess) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Column(
                        children: state.unCompletedTask.reversed
                            .toList()
                            .asMap()
                            .map((i, e) => MapEntry(
                                i,
                                TodoListTiles(
                                    task: e, tapped: () {}, number: i + 1)))
                            .values
                            .toList(),
                      ),
                      Column(
                        children: state.completedTask.reversed
                            .toList()
                            .asMap()
                            .map((i, e) => MapEntry(
                                i,
                                TodoListTiles(
                                    task: e, tapped: () {}, number: i + 1)))
                            .values
                            .toList(),
                      ),
                    ],
                  ),
                );
              } else if (state is TodoInitial) {
                return emptyTodo(_theme);
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  color: kprimaryColor,
                ));
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _nav.navigateTo(PageName.createTaskScreen),
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
