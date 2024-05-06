import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
        leading: const SizedBox.shrink(),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nico Robin',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400),
              ),
              Text(
                'nicorobin089@gmail.com',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'General Settings',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
                ),
              ),
              ProfileTile(
                iconImage: 'assets/app_images/user-1-svgrepo-com 1.png',
                title: 'General Information',
                subTitle: 'Edit Name, Email & Phone Number',
              ),
              ProfileTile(
                iconImage: 'assets/app_images/notification-bell-new.png',
                title: 'Notification',
                subTitle: 'Manage your notifications',
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Security',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
                ),
              ),
              ProfileTile(
                iconImage: 'assets/app_images/lock.png',
                title: 'Password',
                subTitle: 'Manage your passwords',
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Terms',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
                ),
              ),
              ProfileTile(
                iconImage: 'assets/app_images/Frame.png',
                title: 'Contact Support',
                subTitle: 'Contact our customer support',
              ),
              ProfileTile(
                iconImage: 'assets/app_images/policy.png',
                title: 'Policy',
                subTitle: 'Read our policy',
              ),
              ProfileTile(
                iconImage: 'assets/app_images/notification-bell-new.png',
                title: 'Log out',
                subTitle: '''We'll Miss You''',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ProfileTile extends StatelessWidget {
  String title;
  String subTitle;
  String iconImage;
  ProfileTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.iconImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: const Color(0xff18181B),
          borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        leading: Image.asset(
          iconImage,
          height: 21.h,
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
        ),
        subtitle: Text(
          subTitle,
          style: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xffA1A1AA),
              fontWeight: FontWeight.w400),
        ),
        trailing: const Icon(Icons.keyboard_arrow_right_outlined),
      ),
    );
  }
}
