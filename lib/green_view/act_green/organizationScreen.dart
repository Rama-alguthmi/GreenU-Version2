import 'package:chiblane/utils/app_color.dart';
import 'package:chiblane/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrganizationScreen extends StatelessWidget {
  List listdata;
  OrganizationScreen({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CText(text: 'Organizations', fontSize: 20.sp),
      ),
      body: ListView.builder(
          itemCount: listdata.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.blackColor1B,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
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
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 250,
                          child: CText(
                            text: listdata[index]['title'],
                            fontSize: 20.sp,
                            maxLines: 2,
                          ),
                        ),
                        // ignore: prefer_const_constructors
                        Icon(
                          Icons.menu,
                          color: AppColors.whiteCreamyColorD9,
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
