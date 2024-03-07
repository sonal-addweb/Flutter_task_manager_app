import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_manager_app/src/config/app_colors.dart';
import 'package:flutter_task_manager_app/src/config/app_styles.dart';
import 'package:flutter_task_manager_app/src/domain/entities/task_entity.dart';
import 'package:flutter_task_manager_app/src/presentation/bloc/task_bloc.dart';
import 'package:flutter_task_manager_app/src/presentation/widgets/icon_button.dart';
import 'package:flutter_task_manager_app/src/utils/constants/strings.dart';

class AddTaskPage extends StatefulWidget {
  final bool isUpdate;
  final TaskEntity? task;

  const AddTaskPage({Key? key, this.isUpdate = false, this.task})
      : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final titleTextController = TextEditingController();
  final noteTextController = TextEditingController();
  final currentDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text(addTask),
        backgroundColor: AppColors.background,
        foregroundColor: Colors.white,
        elevation: 0,),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            buildBody(),
          ],
        ),
      ),
    );
  }

  Widget buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.background,
      leading: MyIconButton(
        onTap: () => Navigator.of(context).pop(),
        icon: Icons.keyboard_arrow_left,
      ),
      actions: [
        MyIconButton(
          onTap: () => validateInput(),
          text: 'Save',
        ),
      ],
      automaticallyImplyLeading: false, // To hide the back button
    );
  }

  Widget buildBody() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: titleTextController,
            style: AppStyles.textForm,
            cursorColor: AppColors.background,
            maxLines: 3,
            minLines: 1,
            decoration: InputDecoration(
              hintText: 'Title',
              hintStyle: AppStyles.title.copyWith(color: AppColors.background),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.background),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.background),
              ),
            ),
          ),
          const SizedBox(height: 25),
          MyIconButton(
            onTap: () => validateInput(),
            text: 'Save',
          ),
        ],
      ),
    );
  }

  void validateInput() {
    if (titleTextController.text.isNotEmpty) {
      addTaskToDB();
      Navigator.of(context).pop();
    }
  }

  int generateUniqueId() {
    final now = DateTime.now();
    final minute = now.minute;
    final second = now.second;

    final id = int.parse(
        '${minute.toString().padLeft(2, '0')}${second.toString().padLeft(2, '0')}');

    return id;
  }

  void addTaskToDB() {
    BlocProvider.of<TaskBloc>(context).add(
      AddTaskEvent(
        TaskEntity(
          id: generateUniqueId(),
          title: titleTextController.text,
        ),
      ),
    );
  }
}
