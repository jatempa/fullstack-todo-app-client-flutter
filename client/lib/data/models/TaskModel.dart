import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'TaskModel.g.dart';

@JsonSerializable()
class TaskModel extends Equatable {
  final String id;
  final String title;
  final bool done;

  const TaskModel({
    required this.id,
    required this.title,
    required this.done
  });

  @override
  List<Object> get props => [id, title, done];

  @override
  bool get stringify => true;

  factory TaskModel.fromJson(Map<String, dynamic>? json) => _$TaskModelFromJson(json!);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}
