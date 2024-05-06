import 'package:chiblane/utils/app_color.dart';
import 'package:chiblane/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoiceScreen extends StatelessWidget {
  List listdata;
  ChoiceScreen({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CText(text: 'Life Choice', fontSize: 20.sp),
      ),
      body: ListView.builder(
          itemCount: listdata.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(top: 10.h),
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
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 13.w),
                        decoration: BoxDecoration(
                          color: AppColors.whitesoftColor,
                          borderRadius: BorderRadius.circular(45.r),
                        ),
                        child: Center(
                          child: CText(
                            text: 'Trending #${index + 1}',
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
                    text: listdata[index]['title'],
                    fontSize: 37.sp,
                    fontWeight: FontWeight.bold,
                    maxLines: 2,
                    color: AppColors.blackrock,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
