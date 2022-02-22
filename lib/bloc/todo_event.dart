part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class TodoGetAllTaskEvent extends TodoEvent {}

class TodoGetOnlyOneTaskEvent extends TodoEvent {
  final Task task;

  const TodoGetOnlyOneTaskEvent({required this.task});
  @override
  List<Object> get props => [task];
}

class TodoUpdateTaskEvent extends TodoEvent {
  final Task task;
  const TodoUpdateTaskEvent({required this.task});
}

class TodoCheckBoxUpdate extends TodoEvent {
  final Task task;
  const TodoCheckBoxUpdate({required this.task});
}

class TodoDeleteTaskEvent extends TodoEvent {
  final String id;
  const TodoDeleteTaskEvent({required this.id});
}

class TodoInsertTaskEvent extends TodoEvent {
  final String title;
  final String description;

  const TodoInsertTaskEvent({required this.title, required this.description});
}
