import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:todoapp/config/graphql_endpoints.dart';

const endpointURl = """
https://todolistassessment.hasura.app/v1/graphql""";

class GraphqlConfigs {
  ValueNotifier<GraphQLClient> getClient() {
    ValueNotifier<GraphQLClient> _client = ValueNotifier(GraphQLClient(
      link: HttpLink(endpointURl, defaultHeaders: {
        "x-hasura-admin-secret":
            "JG7vDm15n1fVT2QhwYNyDFJJmm5iQKIea3H0tVpYnNV735Wa2ms3msthBGquM2sm",
        "content-type": "application/json"
      }),
      cache: GraphQLCache(store: HiveStore()),
    ));

    return _client;
  }

  mutateFunction(String query, Map<String, Object> variables) async {
    ValueNotifier<GraphQLClient> _client = getClient();

    QueryResult result = await _client.value
        .mutate(MutationOptions(document: gql(query), variables: variables));

    if (result.hasException) {
      print(result.exception);
      if (result.exception!.graphqlErrors.isEmpty) {
        print("Internet is not found");
      } else {
        print(result.exception!.graphqlErrors[0].message.toString());
      }
    } else {
      print("Task was successfully added");
      return result.data;
    }
  }

  queryFunction(String query, Map<String, String> variables) async {
    ValueNotifier<GraphQLClient> _client = getClient();

    QueryResult result = await _client.value
        .query(QueryOptions(document: gql(query), variables: variables));

    if (result.hasException) {
      print(result.exception);
      if (result.exception!.graphqlErrors.isEmpty) {
        print("Internet is not found");
      } else {
        print(result.exception!.graphqlErrors[0].message.toString());
      }
    } else {
      print(result.data);

      print("Task was successfully added");
      return result.data;
    }
  }
}

class GetData {
  final GraphqlConfigs _point = GraphqlConfigs();

  String query = """
mutation InsertTask(\$description: String!, \$developer_id: String!, \$title: String!) {
  insert_tasks_one(object: {title: \$title, developer_id: \$developer_id, description: \$description}) {
    created_at
    description
    developer_id
    id
    isCompleted
    title
    updated_at
  }
}
""";

  // Future<void> getTask() async {
  //   ValueNotifier<GraphQLClient> _client = _point.getClient();

  //   QueryResult result = await _client.value.mutate(MutationOptions(
  //       document: gql(query),
  //       variables: {
  //         "developer_id": "Oyaks",
  //         "title": "dsn",
  //         "description": "ndikagk"
  //       }));

  //   if (result.hasException) {
  //     print(result.exception);
  //     if (result.exception!.graphqlErrors.isEmpty) {
  //       print("Internet is not found");
  //     } else {
  //       print(result.exception!.graphqlErrors[0].message.toString());
  //     }
  //   } else {
  //     print(result.data);

  //     print("Task was successfully added");
  //   }
  // }
  Future<void> getTask() async {
    _point.queryFunction(EndpointConfigs.getAllTask, {"developer_id": "Oyaks"});
  }

  Future<void> getSingleTask() async {
    _point.queryFunction(EndpointConfigs.getAllTask, {
      "id": "830a6e53-1395-4f71-b06d-593b0adf9248",
      "developer_id": "Oyaks"
    });
  }
}

class RepoParams {}
