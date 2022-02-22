import 'package:todoapp/data/Irepo.dart';
import 'package:todoapp/model/task.dart';

class MockRepository implements IRepository {
  @override
  Future<Task> deleteTask({required String id}) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getAllTask() {
    // TODO: implement getAllTask
    throw UnimplementedError();
  }

  @override
  Future<Task> getSingleTask({required String id}) {
    // TODO: implement getSingleTask
    throw UnimplementedError();
  }

  @override
  Future<Task> insertTask(
      {required String title, required String description}) {
    // TODO: implement insertTask
    throw UnimplementedError();
  }

  @override
  Future<Task> updateTask({required Task task}) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
