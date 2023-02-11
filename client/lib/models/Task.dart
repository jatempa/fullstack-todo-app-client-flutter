import 'package:equatable/equatable.dart';

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
}