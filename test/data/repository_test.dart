import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todoapp/data/repository.dart';
import 'package:todoapp/model/task.dart';
import 'repository_test.mocks.dart';

@GenerateMocks([Repository])
void main() {
  var repo = MockRepository();
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

  group('Test All Repository Functions', () {
    test('Get all task', () async {
      when(repo.getAllTask()).thenAnswer((_) async => tasks);
      expect(await repo.getAllTask(), tasks);
    });

    test('Insert Task', () async {
      when(repo.insertTask(description: 'Good', title: 'How')).thenAnswer(
          (_) async => tasks[0].copyWith(description: 'Good', title: 'snfl'));
      expect(await repo.insertTask(description: 'Good', title: 'How'),
          tasks[0].copyWith(description: 'Good', title: 'snfl'));
    });

    test('Update Task', () async {
      when(repo.updateTask(task: tasks[0])).thenAnswer((_) async => tasks[0]);
      expect(await repo.updateTask(task: tasks[0]), tasks[0]);
    });
    test('Delete Task', () async {
      when(repo.deleteTask(id: tasks[0].id)).thenAnswer((_) async => tasks[0]);
      expect(await repo.deleteTask(id: tasks[0].id), tasks[0]);
    });
  });
}
