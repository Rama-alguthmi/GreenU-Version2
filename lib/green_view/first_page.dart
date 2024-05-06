import 'dart:developer';

import 'package:chiblane/green_view/add_event.dart';
import 'package:chiblane/models/event_model.dart';
import 'package:chiblane/utils/app_color.dart';
import 'package:chiblane/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../green_auth/signin_screen.dart';
import '../model_view/event_view_model.dart';
import '../widgets/eventWidget.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryyellowColor,
          onPressed: () {
            if (FirebaseAuth.instance.currentUser == null) {
              // Fluttertoast.showToast(msg: 'Please Login First');
              Get.to(() => const SigninScreen());
            } else {
              // Fluttertoast.showToast(msg: 'Add event');
              Get.to(() => const AddEventScreen());
            }
          },
          child: const Icon(
            Icons.add,
            color: AppColors.blackrock,
          ),
        ),
        body: GetBuilder<EventViewModel>(
            init: EventViewModel(),
            builder: (controller) {
              return Column(
                children: [
                  SizedBox(height: 10.h),
                  FirebaseAuth.instance.currentUser == null
                      ? const Center(child: Text('No user Added'))
                      : Flexible(
                          child: StreamBuilder<List<EventModel>>(
                            stream: controller.getDataFromFirestore(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: SizedBox(
                                        height: 25.h,
                                        width: 25.w,
                                        child:
                                            const CircularProgressIndicator()));
                              }
                              if (snapshot.hasError) {
                                return Center(
                                  child: SizedBox(
                                      child: CText(
                                          text: 'No Internet ', fontSize: 25.sp)
                                      // Lottie.asset(AppImages.noInternetImage),
                                      ),
                                );
                              }
                              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                return Center(
                                    child: CText(
                                        text: 'no data ', fontSize: 25.sp));
                                // Center(
                                //   child: SizedBox(
                                //     child:
                                //         Lottie.asset(AppImages.noDataImage),
                                //   ),
                                // );
                              }

                              // Data is available, so you can use it to build your UI
                              List<EventModel> singleEventModels =
                                  snapshot.data!;

                              return ListView.builder(
                                itemCount: singleEventModels.length,
                                itemBuilder: (context, index) {
                                  bool eventsavedBool = false;
                                  bool eventlikeBool = false;
                                  for (var element in singleEventModels[index]
                                      .listofComments!) {
                                    if (element['UserId'] ==
                                        FirebaseAuth
                                            .instance.currentUser!.uid) {
                                      eventsavedBool = true;
                                      log('true');
                                    } else {
                                      eventsavedBool = false;
                                      log('false');
                                    }
                                  }
                                  for (var element in singleEventModels[index]
                                      .listofLikes!) {
                                    if (element['UserId'] ==
                                        FirebaseAuth
                                            .instance.currentUser!.uid) {
                                      eventlikeBool = true;
                                      log('true');
                                    } else {
                                      eventlikeBool = false;
                                      log('false');
                                    }
                                  }
                                  return HomeWidget(
                                    eventModel: singleEventModels[index],
                                    likeNum: eventlikeBool,
                                    savedNum: eventsavedBool,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                ],
              );
            }));
  }
}
