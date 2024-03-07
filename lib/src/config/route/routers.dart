import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/src/presentation/pages/task_detail_page.dart';
import 'package:flutter_task_manager_app/src/utils/constants/app_route.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case AppRoute.viewTask:
      //   return CustomPageRoute(builder: (_) =>  TaskDetailPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

class CustomPageRoute extends MaterialPageRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);

  CustomPageRoute({required super.builder});
//CustomPageRoute({builder}) : super(builder: builder);
}