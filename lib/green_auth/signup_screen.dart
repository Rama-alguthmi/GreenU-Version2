import 'dart:io';
import 'package:chiblane/green_auth/signin_screen.dart';
import 'package:chiblane/utils/appTextfield_controller.dart';
import 'package:chiblane/utils/app_color.dart';
import 'package:chiblane/utils/app_textfield.dart';
import 'package:chiblane/widgets/primary_button.dart';
import 'package:chiblane/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../model_view/authentication_view_model.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),

        body: GetBuilder<AuthenticationViewModel>(
            init: AuthenticationViewModel(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Form(
                    key: sigupformkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 100.h),
                          child: CText(
                            text: 'Welcome To GreenU ',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whitesoftColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 13.h),
                          child: CText(
                            text: 'Start your journey to act green today!',
                            maxLines: 2,
                            alignText: TextAlign.center,
                            fontSize: 30,
                            color: AppColors.whitesoftColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        controller.selectedImage == null
                            ? GestureDetector(
                                onTap: () {
                                  controller.pickImages();
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(top: 15.h),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.greyColor3d,
                                    radius: 50.h,
                                    child: const Center(
                                      child: Icon(
                                        Icons.person,
                                        color: AppColors.primaryyellowColor,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  controller.pickImages();
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(top: 15.h),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.greyColor3d,
                                    backgroundImage: FileImage(
                                        File(controller.selectedImage!.path)),
                                    radius: 50.h,
                                  ),
                                ),
                              ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CText(
                                text: 'User Name',
                                fontSize: 16.sp,
                                color: AppColors.whitesoftColor,
                                fontWeight: FontWeight.bold,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12.h),
                                child: AppTextfields.myTextField(
                                    controller:
                                        AppTextfieldControllers.signupUseName,
                                    lable: 'Type here...',
                                    textInputType: TextInputType.emailAddress),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CText(
                                text: 'Email',
                                fontSize: 16.sp,
                                color: AppColors.whitesoftColor,
                                fontWeight: FontWeight.bold,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12.h),
                                child: AppTextfields.myTextField(
                                    controller:
                                        AppTextfieldControllers.signUpEmail,
                                    lable: 'Type here...',
                                    textInputType: TextInputType.emailAddress),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CText(
                                text: 'Password',
                                fontSize: 16.sp,
                                color: AppColors.whitesoftColor,
                                fontWeight: FontWeight.bold,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12.h),
                                child: AppTextfields.passwordField(
                                  controller:
                                      AppTextfieldControllers.signUpPassword,
                                  textInputAction: TextInputAction.done,
                                ),
                              ),
                            ],
                          ),
                        ),
                        controller.sinUpBool.value == true
                            ? const CircularProgressIndicator()
                            : Padding(
                                padding: EdgeInsets.only(top: 25.h),
                                child: PrimaryButton(
                                  text: 'Sign up',
                                  onTap: () {
                                    if (sigupformkey.currentState!.validate() &&
                                        controller.selectedImage != null) {
                                      controller.signUp();
                                    } else {
                                      if (controller.selectedImage != null) {
                                        Fluttertoast.showToast(
                                            msg: 'Select Image ');
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: 'Enter Fields !!');
                                      }
                                    }
                                  },
                                ),
                              ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CText(
                                text: "Already have account?",
                                fontSize: 14,
                                color: AppColors.whitesoftColor,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const SigninScreen());
                                },
                                child: CText(
                                  text: " Login",
                                  fontSize: 14,
                                  color: AppColors.primaryyellowColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
