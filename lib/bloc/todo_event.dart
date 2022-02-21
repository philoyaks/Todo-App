part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class TodoGetAllTaskEvent extends TodoEvent {}

class TodoGetOnlyOneTaskEvent extends TodoEvent {}

class TodoUpdateTaskEvent extends TodoEvent {}

class TodoDeleteTaskEvent extends TodoEvent {}
