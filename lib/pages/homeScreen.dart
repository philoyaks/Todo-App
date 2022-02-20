import 'package:flutter/material.dart';
import 'package:todoapp/constants/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo List',
          // style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          finishedTodo(
              title: 'Meeting with pop', message: 'You have to work harder'),
          finishedTodo(
              title: 'Meeting with pop', message: 'You have to work harder'),
          pendingTodo(
              title: 'Meeting with pop', message: 'You have to work harder'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }

  Container pendingTodo({String? title, String? message, bool? done}) {
    return Container(
      height: 44,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: kContainerBorderColorOrange,
                width: 1,
              ),
              color: kContainerBackgroundColorOrange,
            ),
            child: const Center(
              child: Text(
                '1',
                style: TextStyle(color: kContainerBorderColorOrange),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title!,
                style: const TextStyle(
                  color: Color(0xff06051b),
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                message!,
                style: const TextStyle(
                  color: Color(0xffa7a6b3),
                  fontSize: 12,
                ),
              )
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: const Color(0xffc4c4c4),
                  width: 1,
                ),
                color: const Color(0xfff2f2f2),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container finishedTodo({String? title, String? message, bool? done}) {
    return Container(
      height: 44,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: kContainerBorderColorGreen,
                width: 1,
              ),
              color: kContainerBackgroundColorGreen,
            ),
            child: const Center(
              child: Text(
                '1',
                style:
                    TextStyle(color: kContainerBorderColorGreen, fontSize: 14),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title!,
                style: const TextStyle(
                    color: Color(0xff06051b),
                    fontSize: 14,
                    decoration: TextDecoration.lineThrough),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                message!,
                style: const TextStyle(
                    color: Color(0xffa7a6b3),
                    fontSize: 12,
                    decoration: TextDecoration.lineThrough),
              )
            ],
          ),
          const Spacer(),
          Transform.scale(
            scale: 1.3,
            child: Checkbox(
              value: false,
              onChanged: (val) {},
              // activeColor: const Color(0xfff2f2f2),
              activeColor: Colors.red,
              fillColor: MaterialStateProperty.all(Colors.red),
              focusColor: Colors.red,
              overlayColor: MaterialStateProperty.all(Color(0xffc4c4c4)),

              side: BorderSide(width: 0.8, color: Color(0xffc4c4c4)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: const Color(0xff00901f),
                  width: 1,
                ),
                color: const Color(0xff00901f),
              ),
              child: Center(child: Icon(Icons.check)),
            ),
          )
        ],
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
              style: _theme.textTheme.bodyText1,
            ),
            const SizedBox(height: 10),
            Text(
              'Create a task',
              style: _theme.textTheme.subtitle1,
            )
          ]),
    );
  }
}
