// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_task.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateTask$Mutation$Task _$UpdateTask$Mutation$TaskFromJson(
        Map<String, dynamic> json) =>
    UpdateTask$Mutation$Task()
      ..id = json['id'] as String
      ..title = json['title'] as String
      ..done = json['done'] as bool?;

Map<String, dynamic> _$UpdateTask$Mutation$TaskToJson(
        UpdateTask$Mutation$Task instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'done': instance.done,
    };

UpdateTask$Mutation _$UpdateTask$MutationFromJson(Map<String, dynamic> json) =>
    UpdateTask$Mutation()
      ..updateTask = json['updateTask'] == null
          ? null
          : UpdateTask$Mutation$Task.fromJson(
              json['updateTask'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateTask$MutationToJson(
        UpdateTask$Mutation instance) =>
    <String, dynamic>{
      'updateTask': instance.updateTask?.toJson(),
    };

UpdateTaskArguments _$UpdateTaskArgumentsFromJson(Map<String, dynamic> json) =>
    UpdateTaskArguments(
      id: json['id'] as String,
    );

Map<String, dynamic> _$UpdateTaskArgumentsToJson(
        UpdateTaskArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
