import 'package:todoapp/config/graphql_endpoints.dart';
import 'package:todoapp/config/graphql_config.dart';
import 'package:todoapp/model/task.dart';

class Repository {
  final GraphqlConfigs _point = GraphqlConfigs();
  static const String _developer_id = 'Oyaks';

  Future<List<Task>> getAllTask() async {
    final response = await _point
        .queryFunction(EndpointConfigs.getAllTask, {"developer_id": "Oyaks"});

    final result =
        (response["tasks"] as List).map((e) => Task.fromJson(e)).toList();

    return result;
  }

  Future<Task> getSingleTask({required String id}) async {
    final response = await _point.queryFunction(
        EndpointConfigs.getSingleTask, {"id": id, "developer_id": "Oyaks"});
    return Task.fromJson(response['tasks_by_pk']);
  }

  Future<Task> insertTask(
      {required String title, required String description}) async {
    final response = await _point.mutateFunction(EndpointConfigs.insertTask, {
      "developer_id": "UNIQUE ID FOR YOUR APP",
      "title": title,
      "description": description
    });
    return Task.fromJson(response["insert_tasks_one"]);
  }

  Future<Task> updateTask(
      {required String id,
      required String title,
      required String description}) async {
    final response =
        await _point.mutateFunction(EndpointConfigs.getSingleTask, {
      "id": id,
      "payload": {
        "isCompleted": false,
        "title": title,
        "description": description
      }
    });
    return Task.fromJson(response["update_tasks_by_pk"]);
  }

  Future<Task> deleteTask({required String id}) async {
    final response =
        await _point.mutateFunction(EndpointConfigs.getSingleTask, {
      "id": id,
    });
    return Task.fromJson(response["delete_tasks_by_pk"]);
  }
}
