import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

class AppTheme {
  static SystemUiOverlayStyle statusBarStyle = const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light);

  static AppBar dummyAppbar = AppBar(
    toolbarHeight: 0,
    elevation: 0,
    backgroundColor: AppColors.white,
    systemOverlayStyle: statusBarStyle,
  );
}
