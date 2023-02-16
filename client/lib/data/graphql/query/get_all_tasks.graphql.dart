// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'get_all_tasks.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAllTasks$Query$Task extends JsonSerializable with EquatableMixin {
  GetAllTasks$Query$Task();

  factory GetAllTasks$Query$Task.fromJson(Map<String, dynamic> json) =>
      _$GetAllTasks$Query$TaskFromJson(json);

  late String id;

  late String title;

  bool? done;

  @override
  List<Object?> get props => [id, title, done];
  @override
  Map<String, dynamic> toJson() => _$GetAllTasks$Query$TaskToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAllTasks$Query extends JsonSerializable with EquatableMixin {
  GetAllTasks$Query();

  factory GetAllTasks$Query.fromJson(Map<String, dynamic> json) =>
      _$GetAllTasks$QueryFromJson(json);

  List<GetAllTasks$Query$Task?>? tasks;

  @override
  List<Object?> get props => [tasks];
  @override
  Map<String, dynamic> toJson() => _$GetAllTasks$QueryToJson(this);
}

final GET_ALL_TASKS_QUERY_DOCUMENT_OPERATION_NAME = 'GetAllTasks';
final GET_ALL_TASKS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetAllTasks'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'tasks'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'done'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class GetAllTasksQuery
    extends GraphQLQuery<GetAllTasks$Query, JsonSerializable> {
  GetAllTasksQuery();

  @override
  final DocumentNode document = GET_ALL_TASKS_QUERY_DOCUMENT;

  @override
  final String operationName = GET_ALL_TASKS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetAllTasks$Query parse(Map<String, dynamic> json) =>
      GetAllTasks$Query.fromJson(json);
}
