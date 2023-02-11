// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CreateTask.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTask$Mutation$Task _$CreateTask$Mutation$TaskFromJson(
        Map<String, dynamic> json) =>
    CreateTask$Mutation$Task()
      ..id = json['id'] as String
      ..title = json['title'] as String
      ..done = json['done'] as bool?;

Map<String, dynamic> _$CreateTask$Mutation$TaskToJson(
        CreateTask$Mutation$Task instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'done': instance.done,
    };

CreateTask$Mutation _$CreateTask$MutationFromJson(Map<String, dynamic> json) =>
    CreateTask$Mutation()
      ..addTask = json['addTask'] == null
          ? null
          : CreateTask$Mutation$Task.fromJson(
              json['addTask'] as Map<String, dynamic>);

Map<String, dynamic> _$CreateTask$MutationToJson(
        CreateTask$Mutation instance) =>
    <String, dynamic>{
      'addTask': instance.addTask?.toJson(),
    };

CreateTaskArguments _$CreateTaskArgumentsFromJson(Map<String, dynamic> json) =>
    CreateTaskArguments(
      title: json['title'] as String,
    );

Map<String, dynamic> _$CreateTaskArgumentsToJson(
        CreateTaskArguments instance) =>
    <String, dynamic>{
      'title': instance.title,
    };
