import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Task.g.dart';

@JsonSerializable()
class Task extends Equatable {
  final String id;
  final String title;
  final bool done;

  const Task({
    required this.id,
    required this.title,
    required this.done
  });

  @override
  List<Object> get props => [id, title, done];

  @override
  bool get stringify => true;

  factory Task.fromJson(Map<String, dynamic>? json) => _$TaskFromJson(json!);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
