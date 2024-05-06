import 'dart:async';
import 'dart:developer';
import 'package:chiblane/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'green_view/bootom_nevigation_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    checkIntro();
  }

  void checkIntro() {
    log('In check user ');

    Timer(const Duration(seconds: 2), () async {
      // Get.to(() => const OTPVerificationScreen());
      // var user = await SharePrefServices.getLoggeIn();
      // log('user: $user');
      // if (user == true) {
      Get.offAll(() => const BotomnavbarScreen());
      // } else {
      //   Get.offAll(() => const SigninScreen());
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CText(
          text: 'Green App',
          fontSize: 25.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
