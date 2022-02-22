import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoapp/constants/app_constants.dart';
import 'package:todoapp/data/Irepo.dart';
import 'package:todoapp/data/repository.dart';
import 'package:todoapp/model/task.dart';
import 'package:todoapp/route.dart';
import 'package:intl/intl.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final IRepository _repo;
  final NavigationService _nav = locator<NavigationService>();

  TodoBloc(this._repo) : super(TodoInitial()) {
    on<TodoGetAllTaskEvent>(_getAllTask);
    on<TodoGetOnlyOneTaskEvent>(_getOneTask);
    on<TodoInsertTaskEvent>(_insertTask);
    on<TodoUpdateTaskEvent>(_updateTask);
    on<TodoDeleteTaskEvent>(_deleteTask);
    // on<TodoLoading>((event, emit) => null);
  }
  void _getAllTask(TodoGetAllTaskEvent event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    final result = await _repo.getAllTask();
    var unCompletedTask =
        result.where((element) => element.isCompleted == false).toList();
    unCompletedTask.sort((a, b) => a.updatedAt.compareTo(b.updatedAt));

    var completedTask =
        result.where((element) => element.isCompleted == true).toList();
    completedTask.sort((a, b) => a.updatedAt.compareTo(b.updatedAt));

    if (result.isEmpty) {
      emit(TodoInitial());
    } else {
      emit(TodoLoadSucess(
          completedTask: completedTask, unCompletedTask: unCompletedTask));
    }
  }

  FutureOr<void> _getOneTask(
      TodoGetOnlyOneTaskEvent event, Emitter<TodoState> emit) async {
    try {
      _nav.navigateTo(PageName.editTaskScreen, arguments: [event.task]);
    } catch (e) {
      emit(TodoLoadFailure());
    }
  }

  Future<FutureOr<void>> _insertTask(
      TodoInsertTaskEvent event, Emitter<TodoState> emit) async {
    try {
      emit(TodoLoading());
      final repo = await _repo.insertTask(
          description: event.description, title: event.title);
      // if (repo.id.isEmpty) {
      //   emit(TodoInitial());
      // } else {
      //   emit(TodoLoadSucess(result: result));
      // }
      _nav.navigateTo(PageName.homeScreen);
    } catch (e) {
      TodoLoadFailure();
    }
  }

  FutureOr<void> _updateTask(
      TodoUpdateTaskEvent event, Emitter<TodoState> emit) async {
    try {
      emit(TodoLoading());
      await _repo.updateTask(task: event.task);

      _nav.navigateTo(PageName.homeScreen);
    } catch (e) {}
  }

  FutureOr<void> _deleteTask(
      TodoDeleteTaskEvent event, Emitter<TodoState> emit) async {
    try {
      emit(TodoLoading());
      await _repo.deleteTask(id: event.id);
      _nav.navigateTo(PageName.homeScreen);
    } catch (e) {}
  }
}
