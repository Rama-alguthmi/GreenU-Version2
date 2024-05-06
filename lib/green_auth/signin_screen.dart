import 'package:chiblane/green_auth/signup_screen.dart';
import 'package:chiblane/model_view/authentication_view_model.dart';
import 'package:chiblane/utils/appTextfield_controller.dart';
import 'package:chiblane/utils/app_color.dart';
import 'package:chiblane/utils/app_textfield.dart';
import 'package:chiblane/widgets/primary_button.dart';
import 'package:chiblane/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: siginformkey,
      child: Scaffold(
          body: GetBuilder<AuthenticationViewModel>(
              init: AuthenticationViewModel(),
              builder: (controller) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SingleChildScrollView(
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
                        Padding(
                          padding: EdgeInsets.only(top: 25.h),
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
                                        AppTextfieldControllers.signInEmail,
                                    lable: 'Type here...'),
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
                                      AppTextfieldControllers.signInPassword,
                                  textInputAction: TextInputAction.done,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 13.h),
                          child: Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            child: CheckboxListTile(
                              // splashRadius: 0.0,
                              title: CText(
                                text: 'I agree to terms & conditions',
                                fontSize: 14.sp,
                                color: AppColors.whitesoftColor,
                              ),
                              contentPadding: EdgeInsets.zero,
                              secondary: CText(
                                text: 'Forget Password',
                                textDecoration: TextDecoration.underline,
                                fontSize: 13.sp,
                              ),
                              value: true,
                              onChanged: (newValue) {},
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                        ),
                        controller.sinInBool.value == true
                            ? const CircularProgressIndicator()
                            : Padding(
                                padding: EdgeInsets.only(top: 25.h),
                                child: PrimaryButton(
                                  text: 'Login',
                                  onTap: () {
                                    if (siginformkey.currentState!.validate() &&
                                        controller.selectedImage != null) {
                                      controller.signIn();
                                    } else {
                                      // if (controller.selectedImage != null) {
                                      //   Fluttertoast.showToast(
                                      //       msg: 'Select Image ');
                                      // }
                                      // else {
                                      Fluttertoast.showToast(
                                          msg: 'Enter Fields !!');
                                      // }
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
                                text: "Don't have an account?",
                                fontSize: 14,
                                color: AppColors.whitesoftColor,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const SignupScreen());
                                },
                                child: CText(
                                  text: " Register",
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
                );
              })),
    );
  }
}
