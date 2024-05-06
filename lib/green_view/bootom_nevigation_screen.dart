// import 'package:chiblane/green_view/home_page.dart';
// import 'package:dot_navigation_bar/dot_navigation_bar.dart';
// import 'package:flutter/material.dart';
// // ignore: unused_import
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../utils/app_color.dart';

// class BotomnavbarScreen extends StatefulWidget {
//   const BotomnavbarScreen({super.key});

//   @override
//   State<BotomnavbarScreen> createState() => _BotomnavbarScreenState();
// }

// class _BotomnavbarScreenState extends State<BotomnavbarScreen>
//     with TickerProviderStateMixin {
//   var _selectedTab = 0;

//   void _handleIndexChanged(int i) {
//     setState(() {
//       _selectedTab = i;
//     });
//   }

//   final List _pages = [
//     const HomeScreen(),
//     const Center(
//       child: Text("About"),
//     ),
//     const Center(
//       child: Text("Products"),
//     ),
//     const Center(
//       child: Text("Contact"),
//     ),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedTab],
//       bottomNavigationBar: DotNavigationBar(
//         // margin: EdgeInsets.only(top: 10),
//         currentIndex: _selectedTab,
//         dotIndicatorColor: Colors.black,
//         unselectedItemColor: Colors.grey[300],
//         splashBorderRadius: 50,
//         curve: Curves.linear,
//         itemPadding: EdgeInsets.zero,
//         marginR: EdgeInsets.zero,
//         paddingR: const EdgeInsets.all(5),
//         // enableFloatingNavBar: false,
//         onTap: _handleIndexChanged,
//         items: [
//           /// Home
//           DotNavigationBarItem(
//             icon: const Icon(Icons.home),
//             selectedColor: AppColors.primarylimeCardColor,
//           ),

//           /// Likes
//           DotNavigationBarItem(
//             icon: const Icon(Icons.favorite),
//             selectedColor: AppColors.primarylimeCardColor,
//           ),

//           /// Search
//           DotNavigationBarItem(
//             icon: const Icon(Icons.search),
//             selectedColor: AppColors.primarylimeCardColor,
//           ),

//           /// Profile
//           DotNavigationBarItem(
//             icon: const Icon(Icons.person),
//             selectedColor: AppColors.primarylimeCardColor,
//           ),
//         ],
//       ),
//     );
//   }
// }

// // enum _SelectedTab { home, favorite, search, person }

import 'dart:async';

import 'package:chiblane/green_view/act_green/act_green.dart';
import 'package:chiblane/green_view/home_page.dart';
import 'package:chiblane/green_view/profile.dart';
import 'package:chiblane/utils/app_color.dart';
import 'package:chiblane/utils/app_images.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../mainHome.dart';

class BotomnavbarScreen extends StatefulWidget {
  const BotomnavbarScreen({super.key});

  @override
  State<BotomnavbarScreen> createState() => _BotomnavbarScreenState();
}

class _BotomnavbarScreenState extends State<BotomnavbarScreen>
    with TickerProviderStateMixin {
  var selectedTab = 0;

  void _handleIndexChanged(int i) {
    setState(() {
      selectedTab = i;
    });
  }

  List pages = [
    const MainHome(),
    ActGreen(),
    const HomeScreen(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedTab],
      bottomNavigationBar: DotNavigationBar(
        // margin: EdgeInsets.only(top: 10),
        currentIndex: selectedTab,
        dotIndicatorColor: Colors.black,
        unselectedItemColor: Colors.grey[300],
        splashBorderRadius: 50,
        backgroundColor: AppColors.grey,
        curve: Curves.linear,
        itemPadding: const EdgeInsets.all(0),
        marginR: const EdgeInsets.all(0),
        paddingR: const EdgeInsets.all(5),
        // enableFloatingNavBar: false,
        onTap: _handleIndexChanged,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: Container(
              height: 50.h,
              width: 60.w,
              decoration: BoxDecoration(
                  color: AppColors.appbackgroundColor.withOpacity(0.6),
                  shape: BoxShape.circle
                  // borderRadius: BorderRadius.circular(50.r)
                  ),
              child: const Icon(Icons.home),
            ),

            // icon: Icon(Icons.home),
            selectedColor: AppColors.primarylimeCardColor,
          ),

          /// Likes
          DotNavigationBarItem(
            icon: Container(
              height: 50.h,
              width: 60.w,
              padding: EdgeInsets.all(12.h),
              decoration: BoxDecoration(
                  color: AppColors.appbackgroundColor.withOpacity(0.6),
                  shape: BoxShape.circle
                  // borderRadius: BorderRadius.circular(50.r)
                  ),
              child: SizedBox(
                // width: 10,
                // height: 10,
                child: SvgPicture.asset(
                  "assets/app_images/leaf_s.svg",
                  color: selectedTab == 1
                      ? AppColors.primarylimeCardColor
                      : Colors.white,
                  // width: 10,
                  // height: 10,
                ),
              ),
              //     Image.asset(
              //   "assets/app_images/leaf image.png",
              //   width: 10.w,
              //   height: 10.h,
              // ),
            ),

            // icon: Icon(Icons.energy_savings_leaf_sharp),
            selectedColor: AppColors.primarylimeCardColor,
          ),

          /// Search
          DotNavigationBarItem(
            icon: Container(
              height: 50.h,
              width: 60.w,
              decoration: BoxDecoration(
                  color: AppColors.appbackgroundColor.withOpacity(0.6),
                  shape: BoxShape.circle
                  // borderRadius: BorderRadius.circular(50.r)
                  ),
              child: const Icon(Icons.people_alt_sharp),
            ),

            // icon: Icon(Icons.search),
            selectedColor: AppColors.primarylimeCardColor,
          ),

          /// Profile
          DotNavigationBarItem(
            icon: Container(
              height: 50.h,
              width: 60.w,
              decoration: BoxDecoration(
                  color: AppColors.appbackgroundColor.withOpacity(0.6),
                  shape: BoxShape.circle
                  // borderRadius: BorderRadius.circular(50.r)
                  ),
              child: const Icon(Icons.person),
            ),
            // icon: Icon(Icons.person),
            selectedColor: AppColors.primarylimeCardColor,
          ),
        ],
      ),
    );
  }
}
