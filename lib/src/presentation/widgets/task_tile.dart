import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_manager_app/src/config/app_colors.dart';
import 'package:flutter_task_manager_app/src/config/app_styles.dart';
import 'package:flutter_task_manager_app/src/domain/entities/task_entity.dart';
import 'package:flutter_task_manager_app/src/presentation/bloc/task_bloc.dart';
import 'package:flutter_task_manager_app/src/presentation/pages/task_detail_page.dart';

enum TileType { square, verRect, horRect }

class TaskTile extends StatelessWidget {
  final TaskEntity task;
  final int index;

  const TaskTile({
    Key? key,
    required this.task,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: BlocProvider.of<TaskBloc>(context),
              child: TaskDetailPage(task: task),
            ),
          ),
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.tiles[index % 7],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        task.title,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.title.copyWith(),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        deleteTaskToDB(context);
                      },
                      child: const Icon(
                        Icons.delete,
                        color: AppColors.white,
                      ),
                    )
                  ],
                )),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  deleteTaskToDB(BuildContext context){
    log("task.id  ${task.id}");
    BlocProvider.of<TaskBloc>(context).add(
      DeleteTaskEvent(
        TaskEntity(
          id:  task.id,
          title:  task.title,
        ),
      )
    );
  }


}
