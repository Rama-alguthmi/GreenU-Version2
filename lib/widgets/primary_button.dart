import 'package:chiblane/utils/app_color.dart';
import 'package:chiblane/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class PrimaryButton extends StatelessWidget {
  String text;
  double? height;
  double? width;
  double? textSize;
  double? radius;
  Color? color;
  Function() onTap;
  bool? iconEnable;

  PrimaryButton({
    super.key,
    required this.text,
    this.height,
    this.width,
    this.color,
    this.radius,
    this.textSize,
    required this.onTap,
    this.iconEnable = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 335.w,
        height: height ?? 55.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color ?? AppColors.primaryyellowColor,
          borderRadius: BorderRadius.circular(radius ?? 40.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CText(
              text: text,
              fontSize: textSize ?? 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.blackrock,
            ),
            iconEnable == false
                ? const SizedBox()
                : const Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.primarywhiteColor,
                        size: 18,
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PrimaryButton2 extends StatelessWidget {
  String text;
  Function() onTap;
  bool? iconEnable;
  PrimaryButton2({
    super.key,
    required this.text,
    required this.onTap,
    this.iconEnable = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 335.w,
        height: 50.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primarybackColor),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CText(
              text: text,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.primarywhiteColor,
            ),
            iconEnable == false
                ? const SizedBox()
                : const Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.primarywhiteColor,
                        size: 18,
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PrimaryButton3 extends StatelessWidget {
  String text;
  Function() onTap;
  bool? iconEnable;
  PrimaryButton3({
    super.key,
    required this.text,
    required this.onTap,
    this.iconEnable = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 163.w,
        height: 55.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primarybackColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CText(
              text: text,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.primarywhiteColor,
            ),
            iconEnable == false
                ? const SizedBox()
                : const Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.primarywhiteColor,
                        size: 18,
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class IntroButton extends StatelessWidget {
  Function() onPressed;

  IntroButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 100.w, top: 35.h),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            CText(
              text: 'Next',
              fontSize: 16,
              color: AppColors.primarywhiteColor,
            ),
            const Icon(
              Icons.arrow_forward,
              color: AppColors.primarywhiteColor,
            )
          ],
        ),
      ),
    );
  }
}
