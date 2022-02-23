import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/bloc/todo_bloc.dart';
import 'package:todoapp/constants/app_constants.dart';
import 'package:todoapp/model/task.dart';

// ignore: must_be_immutable
class TodoListTiles extends StatefulWidget {
  final Task task;
  final Function tapped;
  final int number;
  const TodoListTiles(
      {Key? key,
      required this.task,
      required this.tapped,
      required this.number})
      : super(key: key);

  @override
  _TodoListTilesState createState() => _TodoListTilesState();
}

class _TodoListTilesState extends State<TodoListTiles> {
  bool loading = false;

  @override
  void didUpdateWidget(covariant TodoListTiles oldWidget) {
    setState(() {
      loading = false;
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var _size = MediaQuery.of(context).size;

    return Container(
      height: 44,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          widget.task.isCompleted
              ? GestureDetector(
                  onTap: () {
                    context.read<TodoBloc>().add(TodoGetOnlyOneTaskEvent(
                          task: widget.task,
                        ));
                  },
                  child: Row(
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
                        child: Center(
                          child: Text(
                            widget.task.title[0].toUpperCase().toString(),
                            style: const TextStyle(
                                color: kContainerBorderColorGreen,
                                fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: _size.width * 0.68,
                            child: Text(
                              widget.task.title,
                              style: _theme.textTheme.bodyText2!.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          SizedBox(
                            width: _size.width * 0.68,
                            child: Text(widget.task.description,
                                style: _theme.textTheme.subtitle2!
                                    .copyWith(overflow: TextOverflow.ellipsis)),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    context.read<TodoBloc>().add(TodoGetOnlyOneTaskEvent(
                          task: widget.task,
                        ));
                  },
                  child: Row(
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
                        child: Center(
                          child: Text(
                            widget.number.toString(),
                            style: _theme.textTheme.bodyText2!
                                .copyWith(color: kContainerBorderColorOrange),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: _size.width * 0.68,
                            child: Text(
                              widget.task.title,
                              style: const TextStyle(
                                color: Color(0xff06051b),
                                overflow: TextOverflow.ellipsis,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          SizedBox(
                            width: _size.width * 0.68,
                            child: Text(
                              widget.task.description,
                              softWrap: true,
                              style: const TextStyle(
                                color: Color(0xffa7a6b3),
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
          const Spacer(),
          loading
              ? const BlinkingProgressIndicator()
              : Container(
                  padding: const EdgeInsets.all(0),
                  margin: const EdgeInsets.all(0),
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      color: const Color(0xfff2f2f2),
                      borderRadius: BorderRadius.circular(6)),
                  child: Transform.scale(
                    scale: 1.4,
                    child: Checkbox(
                      value: widget.task.isCompleted,
                      onChanged: (val) async {
                        setState(() {
                          loading = true;
                        });
                        context.read<TodoBloc>().add(TodoCheckBoxUpdate(
                            task: widget.task.copyWith(
                                isCompleted: !widget.task.isCompleted)));
                        await Future.delayed(const Duration(seconds: 15));

                        if (mounted) {
                          setState(() {
                            loading = false;
                          });
                        }
                      },
                      activeColor: const Color(0xff00901f),
                      side: const BorderSide(
                          width: 0.8, color: Color(0xffc4c4c4)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

//BLinlinking Progress indication custom made
class BlinkingProgressIndicator extends StatefulWidget {
  const BlinkingProgressIndicator({Key? key}) : super(key: key);

  @override
  _BlinkingProgressIndicatorState createState() =>
      _BlinkingProgressIndicatorState();
}

class _BlinkingProgressIndicatorState extends State<BlinkingProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: Container(
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.all(0),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
            color: kprimaryColor, borderRadius: BorderRadius.circular(6)),
      ),
    );
  }
}
