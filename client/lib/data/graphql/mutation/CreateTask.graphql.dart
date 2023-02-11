// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'CreateTask.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateTask$Mutation$Task extends JsonSerializable with EquatableMixin {
  CreateTask$Mutation$Task();

  factory CreateTask$Mutation$Task.fromJson(Map<String, dynamic> json) =>
      _$CreateTask$Mutation$TaskFromJson(json);

  late String id;

  late String title;

  bool? done;

  @override
  List<Object?> get props => [id, title, done];
  @override
  Map<String, dynamic> toJson() => _$CreateTask$Mutation$TaskToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateTask$Mutation extends JsonSerializable with EquatableMixin {
  CreateTask$Mutation();

  factory CreateTask$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CreateTask$MutationFromJson(json);

  CreateTask$Mutation$Task? addTask;

  @override
  List<Object?> get props => [addTask];
  @override
  Map<String, dynamic> toJson() => _$CreateTask$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateTaskArguments extends JsonSerializable with EquatableMixin {
  CreateTaskArguments({required this.title});

  @override
  factory CreateTaskArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateTaskArgumentsFromJson(json);

  late String title;

  @override
  List<Object?> get props => [title];
  @override
  Map<String, dynamic> toJson() => _$CreateTaskArgumentsToJson(this);
}

final CREATE_TASK_MUTATION_DOCUMENT_OPERATION_NAME = 'CreateTask';
final CREATE_TASK_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateTask'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'title')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'addTask'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'title'),
            value: VariableNode(name: NameNode(value: 'title')),
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

class CreateTaskMutation
    extends GraphQLQuery<CreateTask$Mutation, CreateTaskArguments> {
  CreateTaskMutation({required this.variables});

  @override
  final DocumentNode document = CREATE_TASK_MUTATION_DOCUMENT;

  @override
  final String operationName = CREATE_TASK_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final CreateTaskArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  CreateTask$Mutation parse(Map<String, dynamic> json) =>
      CreateTask$Mutation.fromJson(json);
}
