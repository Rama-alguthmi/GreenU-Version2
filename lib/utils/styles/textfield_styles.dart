import 'package:chiblane/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecoration mytextfieldDecoration({
  required String lable,
  IconData? trailingicon,
}) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(
      vertical: 10.h,
      horizontal: 10.w,
    ),
    // enabledBorder: InputBorder .none,
    fillColor: AppColors.greyColor3d,
    filled: true,

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
    ),
    //     borderSide:
    //         BorderSide(color: AppColors.myPrimary.withOpacity(0.5))),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
    ),

    suffixIcon: trailingicon != null
        ? Icon(trailingicon, color: AppColors.primarycardColor)
        : null,
    suffixIconConstraints:
        const BoxConstraints(maxHeight: 24, maxWidth: 40, minWidth: 40),
    hintText: lable,
    hintStyle: TextStyle(color: AppColors.greyColor, fontSize: 16.sp),
    floatingLabelStyle: TextStyle(color: AppColors.greyColor, fontSize: 16.sp),
  );
}
