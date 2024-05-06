import 'package:chiblane/green_auth/signin_screen.dart';
import 'package:chiblane/green_view/add_event.dart';
import 'package:chiblane/green_view/groups/community_group.dart';
import 'package:chiblane/green_view/first_page.dart';
import 'package:chiblane/utils/app_color.dart';
import 'package:chiblane/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'points/points.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            bottom: TabBar(
              indicator: BoxDecoration(
                color: AppColors.greenColor635,
                borderRadius: BorderRadius.circular(50.r),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: TextStyle(
                color: AppColors.blackrock,
                fontSize: 14.sp,
              ),
              tabs: const [
                Tab(text: 'Events'),
                Tab(text: 'Groups'),
                Tab(text: 'Points'),
              ],
            ),
            title: CText(
              text: 'Community',
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            )),
        body: TabBarView(
          children: [
            const FirstPage(),
            CommunityGroup(),
            Points(),
          ],
        ),
      ),
    );
  }
}
