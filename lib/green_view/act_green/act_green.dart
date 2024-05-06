import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'first_screen.dart';

// ignore: must_be_immutable
class ActGreen extends StatefulWidget {
  const ActGreen({Key? key}) : super(key: key);

  @override
  State<ActGreen> createState() => _ActGreenState();
}

class _ActGreenState extends State<ActGreen> {
  @override
  void initState() {
    checkIntro();
    super.initState();
  }

  void checkIntro() {
    Timer(const Duration(seconds: 0), () async {
      actGreenDialog();
    });
  }

  List actsList = [
    {
      'title': 'Waste Management',
      'img': 'assets/app_images/waster_man.png',
      'color': 0xff9CCEFF,
    },
    {
      'title': 'Green Shopping',
      'img': 'assets/app_images/green_sho.png',
      'color': 0xffE351C4,
    },
    {
      'title': 'Transportation Planning',
      'img': 'assets/app_images/trans_Con.png',
      'color': 0xffFFF44F,
    },
    {
      'title': 'Energy Consumption',
      'img': 'assets/app_images/energy_Con.png',
      'color': 0xffFF8437,
    },
    {
      'title': 'Water Conservation',
      'img': 'assets/app_images/water_Con.png',
      'color': 0xff0168FD,
    },
    {
      'title': 'Food conservation',
      'img': 'assets/app_images/food_Con.png',
      'color': 0xff1FCF6A,
    },
  ];

  Future<dynamic> actGreenDialog() {
    return Get.defaultDialog(
        backgroundColor: Colors.black,
        title: '',
        titlePadding: EdgeInsets.zero,
        contentPadding: const EdgeInsets.all(18),
        content: Column(
          children: [
            CircleAvatar(
              backgroundImage: const AssetImage('assets/app_images/leaf.png'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                padding: const EdgeInsets.all(8.0),
                itemCount: actsList.length,
                itemBuilder: (context, index) {
                  var color = actsList[index]['color'];
                  // log('color: $color');
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => FirstScreen(
                            title: actsList[index]['title'],
                          ));
                    },
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(color),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(index == 4 ? 10 : 13),
                              width: 65.w,
                              height: 65.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.5)),
                              child: SizedBox(
                                child: Image.asset(
                                  actsList[index]['img'],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 110.w,
                                  child: Text(
                                    actsList[index]['title'],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Container(
                                    width: 45.w,
                                    height: 45.h,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black),
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          ],
                        )),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
