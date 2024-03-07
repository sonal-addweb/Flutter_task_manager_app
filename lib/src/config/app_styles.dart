import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/src/config/app_colors.dart';

class AppStyles {
  static final title =  TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static final textForm =  TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
  );

  static final body = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  // static final date = GoogleFonts.lato(
  //   fontSize: 20,
  //   fontWeight: FontWeight.w400,
  //   color: Colors.grey,
  // );
  //
  // static final noteTitle = GoogleFonts.lato(
  //   fontSize: 22,
  //   fontWeight: FontWeight.w500,
  //   color: Colors.black,
  // );
}
