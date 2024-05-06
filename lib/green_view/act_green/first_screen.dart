import 'dart:developer';

import 'package:chiblane/green_view/act_green/all_widget/second_screen_widget.dart';
import 'package:chiblane/green_view/act_green/choice_screen.dart';
import 'package:chiblane/green_view/act_green/eventScreen.dart';
import 'package:chiblane/green_view/act_green/organizationScreen.dart';
import 'package:chiblane/utils/app_color.dart';
import 'package:chiblane/utils/data_json_file.dart';
import 'package:chiblane/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class FirstScreen extends StatefulWidget {
  String title;
  FirstScreen({super.key, required this.title});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var mysaveddata;
  @override
  void initState() {
    setState(() {
      mysaveddata = myData[widget.title];
      // log(mysaveddata.toString());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CText(
          text: widget.title,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
              decoration: BoxDecoration(
                color: AppColors.blackColor1B,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: SizedBox(
                      height: 42.h,
                      width: 42.w,
                      child: const Image(
                        image: AssetImage('assets/app_images/singleimg.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: CText(
                      text: 'Amanda',
                      fontSize: 16.sp,
                    ),
                    subtitle: CText(text: 'Author', fontSize: 14.sp),
                    trailing: CText(
                      text: 'Sunday, April 14, 2024',
                      fontSize: 14.sp,
                    ),
                  ),
                  Container(
                    height: 240.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      image: const DecorationImage(
                        image: AssetImage(
                            'assets/app_images/firstWidgetMainImg.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 19.h),
                    child: CText(
                      text:
                          'Dispose of waste responsibly and reduce your ecological footprint. Learn easy tips to sort and recycle waste',
                      fontSize: 16.sp,
                      maxLines: 3,
                      color: AppColors.whitesoftColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 13.h),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => ChoiceScreen(
                              listdata: mysaveddata['Life choices'],
                            ));
                      },
                      child: Container(
                        height: 500.h,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: AppColors.green,
                            borderRadius: BorderRadius.circular(25.r)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15.h, horizontal: 15.w),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          child: Image(
                                              image: AssetImage(
                                                  'assets/app_images/heartHand.png')),
                                        ),
                                        Icon(Icons.arrow_outward_rounded)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15.h, horizontal: 15.w),
                                      child: CText(
                                        text: 'Life choices',
                                        fontSize: 35.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.blackrock,
                                      )),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => OrganizationScreen(
                                      listdata: mysaveddata['Organizations'],
                                    ));
                              },
                              child: Container(
                                height: 350.h,
                                width: Get.width,
                                decoration: BoxDecoration(
                                    color: AppColors.yellow,
                                    borderRadius: BorderRadius.circular(25.r)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15.h,
                                                horizontal: 15.w),
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  child: Image(
                                                      image: AssetImage(
                                                          'assets/app_images/handinHand.png')),
                                                ),
                                                Icon(
                                                    Icons.arrow_outward_rounded)
                                              ],
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15.h,
                                                  horizontal: 15.w),
                                              child: CText(
                                                text: 'Organizations',
                                                fontSize: 35.sp,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.blackrock,
                                              )),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => EventLScreen(
                                              listdata: mysaveddata['Events'],
                                            ));
                                      },
                                      child: Container(
                                        height: 200.h,
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryskyColor,
                                          borderRadius:
                                              BorderRadius.circular(25.r),
                                        ),
                                        child: SizedBox(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 15.h,
                                                    horizontal: 15.w),
                                                child: const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      child: Image(
                                                          image: AssetImage(
                                                              'assets/app_images/handinHand.png')),
                                                    ),
                                                    Icon(Icons
                                                        .arrow_outward_rounded)
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 15.h,
                                                      horizontal: 15.w),
                                                  child: CText(
                                                    text: 'Events',
                                                    fontSize: 35.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.blackrock,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
