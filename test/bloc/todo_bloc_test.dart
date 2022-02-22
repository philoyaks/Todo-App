import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todoapp/bloc/todo_bloc.dart';
import 'package:todoapp/constants/app_constants.dart';
import 'package:todoapp/data/Irepo.dart';
import 'package:todoapp/data/mockrepository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todoapp/model/task.dart';

class MockTaskRepository extends Mock implements IRepository {}

void main() {
  setUpAll(() {
    setupLocator();
  });
  group('TodoBloc test', () {
    late TodoBloc todoBloc;
    MockTaskRepository? mockTaskRepository;
    List<Task> tasks = [
      Task(
          createdAt: '',
          description: 'gcjcj',
          developerId: 'oyaks',
          id: '1',
          isCompleted: true,
          title: 'task1',
          updatedAt: ''),
      Task(
          createdAt: '',
          description: 'gcjcj',
          developerId: 'oyaks',
          id: '2',
          isCompleted: true,
          title: 'task2',
          updatedAt: ''),
      Task(
          createdAt: '',
          description: 'gcjcj',
          developerId: 'oyaks',
          id: '3',
          isCompleted: true,
          title: 'task3',
          updatedAt: ''),
    ];

    setUp(() {
      EquatableConfig.stringify = true;
      mockTaskRepository = MockTaskRepository();
      todoBloc = TodoBloc(mockTaskRepository!);
    });

    blocTest<TodoBloc, TodoState>(
      'Gwt All Task',
      build: () {
        when(() => mockTaskRepository!.getAllTask())
            .thenAnswer((_) async => tasks);
        return todoBloc;
      },
      act: (bloc) => bloc.add(TodoGetAllTaskEvent()),
      expect: () => [
        TodoLoading(),
        TodoLoadSucess(unCompletedTask: [], completedTask: tasks)
      ],
    );
    blocTest<TodoBloc, TodoState>(
      'Gets single Task',
      build: () {
        when(() => mockTaskRepository!.getSingleTask(id: tasks[0].id))
            .thenAnswer((_) async => tasks[0]);
        return todoBloc;
      },
      act: (bloc) => bloc.add(TodoGetOnlyOneTaskEvent(task: tasks[0])),
      expect: () => [TodoLoadFailure()],
    );

    blocTest<TodoBloc, TodoState>(
      'Insert Task',
      build: () {
        when(() => mockTaskRepository!.insertTask(description: '', title: 'sd'))
            .thenAnswer((_) async => tasks[0]);
        return todoBloc;
      },
      act: (bloc) =>
          bloc.add(const TodoInsertTaskEvent(description: '', title: '')),
      expect: () => [TodoLoading()],
    );
    blocTest<TodoBloc, TodoState>(
      'Update Task',
      build: () {
        when(() => mockTaskRepository!.updateTask(task: tasks[0]))
            .thenAnswer((_) async => tasks[0]);
        return todoBloc;
      },
      act: (bloc) => bloc.add(TodoUpdateTaskEvent(task: tasks[0])),
      expect: () => [TodoLoading()],
    );

    blocTest<TodoBloc, TodoState>(
      'Delete Task',
      build: () {
        when(() => mockTaskRepository!.deleteTask(id: tasks[0].id))
            .thenAnswer((_) async => tasks.removeAt(0));
        return todoBloc;
      },
      act: (bloc) => bloc.add(TodoDeleteTaskEvent(id: tasks[0].id)),
      expect: () => [TodoLoading()],
    );

    tearDown(() {
      todoBloc.close();
    });
  });
}
