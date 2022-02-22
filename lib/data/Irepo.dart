import '../model/task.dart';

abstract class IRepository {
  Future<List<Task>> getAllTask();
  Future<Task> getSingleTask({required String id});
  Future<Task> insertTask({required String title, required String description});
  Future<Task> updateTask({required Task task});
  Future<Task> deleteTask({required String id});
}
