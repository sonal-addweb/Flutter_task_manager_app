import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/src/domain/entities/task_entity.dart';
import 'package:flutter_task_manager_app/src/presentation/widgets/task_tile.dart';

class DisplayTasks extends StatelessWidget {
  DisplayTasks({super.key, required this.tasks});

  final List<TaskEntity> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
        shrinkWrap: true,
        itemBuilder: (context, index){
      return TaskTile(
        task: tasks[index],
        index: index,
      );

    });
  }
}
