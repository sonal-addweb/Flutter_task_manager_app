import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/src/config/app_colors.dart';
import 'package:flutter_task_manager_app/src/config/app_styles.dart';
import 'package:flutter_task_manager_app/src/domain/entities/task_entity.dart';
import 'package:flutter_task_manager_app/src/utils/constants/strings.dart';

class TaskDetailPage extends StatelessWidget {
  final TaskEntity task;

  const TaskDetailPage({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text(viewTask),
        backgroundColor: AppColors.background,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
             'Task Title:  ${task.title}',
              style: AppStyles.title
                  .copyWith(color: AppColors.background, fontSize: 16),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
