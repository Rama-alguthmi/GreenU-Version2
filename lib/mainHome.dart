import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'green_view/profile.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage:
                  AssetImage('assets/app_images/profile_avatar.png'),
            ),
            InkWell(
              onTap: () {
                actGreenDialog();
                Get.to(() => const Profile());
              },
              child: const CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xff18181B),
                child: Icon(Icons.notifications_rounded),
              ),
            )
          ],
        ),
        toolbarHeight: 80.h,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(5),
          height: Get.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 17.h),
                      Text(
                        'Good Morning! ',
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Let’s See Your',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w400),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Today’s Tasks',
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Sunday, April 14, 2024',
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.amber,
                      ),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset('assets/app_images/we2.png'),
                              ),
                              // SizedBox(height: 200,)
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 210.h),
                            // height: 210,
                            padding: const EdgeInsets.all(15),
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: const Color(0xff1FCF6A),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '21 FEB 2024',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Volunteers clean up in Jeddah, S.A. parks',
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'By',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black.withOpacity(.4),
                                      ),
                                    ),
                                    Text(
                                      ' Rama Alguthmi',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    ExpansionWidget(
                      title: 'What is Our Vision?',
                      description:
                          'Embark on a sustainable journey with us. We envision a world where every small eco-friendly choice contributes to a healthier planet. Join us in making sustainability a way of life.',
                      color: const Color(0xffFDF866),
                    ),
                    ExpansionWidget(
                      title: 'What is Our Objectives?',
                      description:
                          'We strive to empower individuals with the knowledge and tools to make environmentally conscious decisions. Through education and action, we aim to create a community dedicated to preserving our planet for future generations.',
                      color: const Color(0xff9CCEFF),
                    ),
                    ExpansionWidget(
                      title: 'What is Our Goals?',
                      description:
                          '''Together, let's set and achieve milestones for a greener future. Our goals include promoting recycling, reducing carbon footprint, and fostering a global network of eco-conscious individuals. Join us in making a positive impact.''',
                      color: const Color(0xffFF8437),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> actGreenDialog() {
    return Get.defaultDialog(
        backgroundColor: Colors.black,
        title: '',
        titlePadding: EdgeInsets.zero,
        contentPadding: const EdgeInsets.all(18),
        content: Column(
          children: [
            CircleAvatar(
              backgroundImage:
                  const AssetImage('assets/green/Group 1171278888.png'),
              radius: 37.r,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Act Green',
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Welcome to the heart of action! Here, you can choose your path to make a positive impact. Select from various categories like waste management, energy consumption, and more. Every action, no matter how small, contributes to a greener world. Start your journey to act green today!',
              // textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              width: Get.width,
              child: ElevatedButton(
                onPressed: () {
                  // Add your onPressed function here
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          30.0), // Adjust the value as needed
                    ),
                  ),
                ),
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  child: Text(
                    'Act!',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

// ignore: must_be_immutable
class ExpansionWidget extends StatefulWidget {
  String title;
  String description;
  Color color;

  ExpansionWidget({
    super.key,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  State<ExpansionWidget> createState() => _ExpansionWidgetState();
}

class _ExpansionWidgetState extends State<ExpansionWidget> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.h),
      // height: 210,
      padding: const EdgeInsets.all(15),
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: widget.color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            maxLines: 2,
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          isExpanded
              ? Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                )
              : const SizedBox.shrink(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Center(
                      child: Icon(isExpanded
                          ? Icons.keyboard_arrow_up_sharp
                          : Icons.keyboard_arrow_down_sharp)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
