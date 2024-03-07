

import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable{
  final int id;
  final String title;

  const TaskEntity({
  required this.id,
  required this.title,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>  [title, id];
}