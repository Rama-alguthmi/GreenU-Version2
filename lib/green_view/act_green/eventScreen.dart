import 'package:chiblane/utils/app_color.dart';
import 'package:chiblane/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventLScreen extends StatelessWidget {
  List listdata;
  EventLScreen({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CText(text: 'Event', fontSize: 20.sp),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/app_images/${listdata[index]['img'].toString()}",
                            ),
                          ),
                        ),
                      ),
                      CText(
                        text: listdata[index]['title'],
                        fontSize: 30.sp,
                        color: AppColors.blackrock,
                        maxLines: 2,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 13.h),
                        child: const Divider(
                          color: AppColors.blackrock,
                        ),
                      ),
                      CText(
                        text: listdata[index]['date'],
                        fontSize: 20.sp,
                        color: AppColors.blackrock,
                        maxLines: 2,
                      ),
                    ]));
          }),
    );
  }
}
