import 'package:freezed_annotation/freezed_annotation.dart';

part 'Task.freezed.dart';
part 'Task.g.dart';

@freezed
class Task with _$Task {
  Task._();

  factory Task({
    String? id,
    String? title,
    bool? done
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  @override
  String toString() => title!;
}