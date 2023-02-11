// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetAllTasks.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllTasks$Query$Task _$GetAllTasks$Query$TaskFromJson(
        Map<String, dynamic> json) =>
    GetAllTasks$Query$Task()
      ..id = json['id'] as String
      ..title = json['title'] as String
      ..done = json['done'] as bool?;

Map<String, dynamic> _$GetAllTasks$Query$TaskToJson(
        GetAllTasks$Query$Task instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'done': instance.done,
    };

GetAllTasks$Query _$GetAllTasks$QueryFromJson(Map<String, dynamic> json) =>
    GetAllTasks$Query()
      ..tasks = (json['tasks'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GetAllTasks$Query$Task.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetAllTasks$QueryToJson(GetAllTasks$Query instance) =>
    <String, dynamic>{
      'tasks': instance.tasks?.map((e) => e?.toJson()).toList(),
    };
