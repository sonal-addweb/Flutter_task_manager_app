import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_manager_app/src/config/app_colors.dart';
import 'package:flutter_task_manager_app/src/config/app_styles.dart';
import 'package:flutter_task_manager_app/src/presentation/bloc/task_bloc.dart';
import 'package:flutter_task_manager_app/src/presentation/pages/add_task_page.dart';
import 'package:flutter_task_manager_app/src/presentation/widgets/display_notes.dart';
import 'package:flutter_task_manager_app/src/presentation/widgets/icon_button.dart';
import 'package:flutter_task_manager_app/src/utils/constants/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<TaskBloc>().add(FetchTasks()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(tasks),
    backgroundColor: AppColors.background,
    foregroundColor: Colors.white,
    elevation: 0,),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddTaskPage(task: null),
            ),
          );
        },
        child: const Icon(Icons.add, color: AppColors.background,),
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            buildBody(),
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is LoadingTaskState) {
            return const CircularProgressIndicator();
          } else if (state is TaskLoadedState) {
            return DisplayTasks(tasks: state.tasks);
          } else if (state is LoadedTaskAfterAddingState) {
            return DisplayTasks(tasks: state.tasks);
          } else if (state is TaskErrorState) {
            return Center(
              child: Text('Error loading tasks: ${state.message}'),
            );
          } else {
            return const Center(
              child: Text('No task added...'),
            );
          }
        },
      ),
    );
  }
}
