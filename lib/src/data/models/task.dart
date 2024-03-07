import 'package:equatable/equatable.dart';
import 'package:flutter_task_manager_app/src/domain/entities/task_entity.dart';

class TaskModel extends Equatable {
  int id;
  final String title;

  TaskModel({required this.id, required this.title});

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json['id'],
        title: json['title'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };

  factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel(
      id: entity.id,
      title: entity.title,
    );
  }

  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      title: title,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, title];
}
