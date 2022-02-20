import 'package:flutter/material.dart';
import 'package:todoapp/constants/app_theme.dart';

// ignore: must_be_immutable
class TodoListTiles extends StatefulWidget {
  bool done;
  final String? title;
  final String? message;
  TodoListTiles(
      {Key? key,
      required this.done,
      required this.title,
      required this.message})
      : super(key: key);

  @override
  _TodoListTilesState createState() => _TodoListTilesState();
}

class _TodoListTilesState extends State<TodoListTiles> {
  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return Container(
      height: 44,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          widget.done
              ? Row(
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
                          style: TextStyle(
                              color: kContainerBorderColorGreen, fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.title!,
                          style: _theme.textTheme.bodyText2!
                              .copyWith(decoration: TextDecoration.lineThrough),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(widget.message!, style: _theme.textTheme.subtitle2)
                      ],
                    ),
                  ],
                )
              : Row(
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
                          '1',
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
                        Text(
                          widget.title!,
                          style: const TextStyle(
                            color: Color(0xff06051b),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          widget.message!,
                          style: const TextStyle(
                            color: Color(0xffa7a6b3),
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
          const Spacer(),
          Container(
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
                value: widget.done,
                onChanged: (val) {
                  setState(() {
                    widget.done = !widget.done;
                  });
                },
                activeColor: const Color(0xff00901f),
                side: const BorderSide(width: 0.8, color: Color(0xffc4c4c4)),
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
