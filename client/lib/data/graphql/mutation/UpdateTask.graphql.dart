// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'UpdateTask.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class UpdateTask$Mutation$Task extends JsonSerializable with EquatableMixin {
  UpdateTask$Mutation$Task();

  factory UpdateTask$Mutation$Task.fromJson(Map<String, dynamic> json) =>
      _$UpdateTask$Mutation$TaskFromJson(json);

  late String id;

  late String title;

  bool? done;

  @override
  List<Object?> get props => [id, title, done];
  @override
  Map<String, dynamic> toJson() => _$UpdateTask$Mutation$TaskToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateTask$Mutation extends JsonSerializable with EquatableMixin {
  UpdateTask$Mutation();

  factory UpdateTask$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateTask$MutationFromJson(json);

  UpdateTask$Mutation$Task? updateTask;

  @override
  List<Object?> get props => [updateTask];
  @override
  Map<String, dynamic> toJson() => _$UpdateTask$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateTaskArguments extends JsonSerializable with EquatableMixin {
  UpdateTaskArguments({required this.id});

  @override
  factory UpdateTaskArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskArgumentsFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$UpdateTaskArgumentsToJson(this);
}

final UPDATE_TASK_MUTATION_DOCUMENT_OPERATION_NAME = 'UpdateTask';
final UPDATE_TASK_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateTask'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateTask'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
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

class UpdateTaskMutation
    extends GraphQLQuery<UpdateTask$Mutation, UpdateTaskArguments> {
  UpdateTaskMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_TASK_MUTATION_DOCUMENT;

  @override
  final String operationName = UPDATE_TASK_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UpdateTaskArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateTask$Mutation parse(Map<String, dynamic> json) =>
      UpdateTask$Mutation.fromJson(json);
}
