import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_manager_app/src/config/theme.dart';
import 'package:flutter_task_manager_app/src/data/datasource/local_data/database_helper.dart';
import 'package:flutter_task_manager_app/src/presentation/bloc/task_bloc.dart';
import 'package:flutter_task_manager_app/src/presentation/pages/home_page.dart';
import 'injection.dart' as di;
import 'package:provider/provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final db = DatabaseHelper();
  await db.initDB();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiProvider(
        providers: [
          BlocProvider(create: (_) => di.locator<TaskBloc>())],
        child:  MaterialApp(
          theme: AppTheme.light,
          title: 'Flutter Task Manager App',
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        ),

    );
  }
}
