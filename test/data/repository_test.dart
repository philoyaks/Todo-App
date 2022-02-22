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
      when(repo.insertTask(description: any, title: 'snfl')).thenAnswer(
          (_) async => tasks[0].copyWith(description: 'Good', title: 'snfl'));
      expect(await repo.insertTask(),
          tasks[0].copyWith(description: '', title: 'name'));
    });
  });
}
