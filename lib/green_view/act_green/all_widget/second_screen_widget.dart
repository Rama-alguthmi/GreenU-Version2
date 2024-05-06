import 'package:chiblane/utils/app_color.dart';
import 'package:chiblane/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SecondScreenWidget extends StatelessWidget {
  const SecondScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.whiteCreamyColorD9,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 13.w),
                decoration: BoxDecoration(
                  color: AppColors.whitesoftColor,
                  borderRadius: BorderRadius.circular(45.r),
                ),
                child: Center(
                  child: CText(
                    text: 'Trending #1',
                    fontSize: 14.sp,
                    color: AppColors.blackrock,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: AppColors.blackrock,
                ),
              )
            ],
          ),
          CText(
            text: 'Say No to Single-Use Plastics',
            fontSize: 37.sp,
            fontWeight: FontWeight.bold,
            maxLines: 2,
            color: AppColors.blackrock,
          ),
        ],
      ),
    );
  }
}
