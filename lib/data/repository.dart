import 'package:todoapp/config/graphql_endpoints.dart';
import 'package:todoapp/config/graphql_config.dart';
import 'package:todoapp/model/task.dart';

class Repository {
  final GraphqlConfigs _point = GraphqlConfigs();
  static const String _developerId = 'Oyaks';

  Future<List<Task>> getAllTask() async {
    final response = await _point.queryFunction(
        EndpointConfigs.getAllTask, {"developer_id": _developerId});
    final result =
        (response["tasks"] as List).map((e) => Task.fromMap(e)).toList();

    return result;
  }

  Future<Task> getSingleTask({required String id}) async {
    final response = await _point.queryFunction(
        EndpointConfigs.getSingleTask, {"id": id, "developer_id": "Oyaks"});
    return Task.fromMap(response['tasks_by_pk']);
  }

  Future<Task> insertTask(
      {required String title, required String description}) async {
    final response = await _point.mutateFunction(EndpointConfigs.insertTask, {
      "developer_id": _developerId,
      "title": title,
      "description": description
    });
    return Task.fromMap(response["insert_tasks_one"]);
  }

  Future<Task> updateTask({required Task task}) async {
    final response = await _point.mutateFunction(EndpointConfigs.updateTask, {
      "id": task.id,
      "payload": {
        "isCompleted": task.isCompleted,
        "title": task.title,
        "description": task.description
      }
    });
    return Task.fromMap(response["update_tasks_by_pk"]);
  }

  Future<Task> deleteTask({required String id}) async {
    final response = await _point.mutateFunction(EndpointConfigs.deleteTask, {
      "id": id,
    });
    return Task.fromMap(response["delete_tasks_by_pk"]);
  }
}
