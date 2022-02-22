part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoadSucess extends TodoState {
  final List<Task> unCompletedTask;
  final List<Task> completedTask;

  const TodoLoadSucess(
      {required this.unCompletedTask, required this.completedTask});

  @override
  List<Object> get props => [unCompletedTask, completedTask];
}

class TodoLoadOneSucess extends TodoState {
  final Task result;

  const TodoLoadOneSucess({required this.result});

  @override
  List<Object> get props => [super.props, result];
}

class TodoLoadFailure extends TodoState {}
