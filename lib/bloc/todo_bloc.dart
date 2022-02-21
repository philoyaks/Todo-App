import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoapp/config/graphql_endpoints.dart';
import 'package:todoapp/data/repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  Repository _repo = Repository();

  TodoBloc() : super(TodoInitial()) {
    on<TodoGetAllTaskEvent>(_getAllTask);
    // on<TodoLoading>((event, emit) => null);
  }
  _getAllTask(TodoGetAllTaskEvent event, emit) {}
}
