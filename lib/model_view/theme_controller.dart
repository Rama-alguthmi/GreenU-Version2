// ignore_for_file: depend_on_referenced_packages

import 'package:chiblane/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  RxBool isLightTheme = false.obs;

  saveThemeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('theme', isLightTheme.value);
  }

  getAndApplyTheme() async {
    isLightTheme.value = await _getThemeFromPref();
    Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }

  _getThemeFromPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var theme = prefs.getBool('theme');
    return theme ?? false;
  }

  ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.appbackgroundColor,
      brightness: Brightness.dark,
      primaryColor: AppColors.primarybackColor,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.black,
        disabledColor: Colors.grey,
      ));

  ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.primarybackColor,
      brightness: Brightness.light,
      primaryColor: AppColors.primarybackColor,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.black,
        disabledColor: Colors.grey,
      ));
}
