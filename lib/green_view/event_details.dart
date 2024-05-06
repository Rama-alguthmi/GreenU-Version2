import 'dart:developer';

import 'package:chiblane/model_view/event_view_model.dart';
import 'package:chiblane/utils/app_color.dart';
import 'package:chiblane/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

import '../models/event_model.dart';
import '../widgets/primary_button.dart';

// ignore: must_be_immutable
class EventDetailScreen extends StatelessWidget {
  EventModel eventModel;
  EventDetailScreen({super.key, required this.eventModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: GetBuilder<EventViewModel>(
            init: EventViewModel(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    FadeInImage(
                      height: 400.h,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/sample_images/pagelogo.png",
                          fit: BoxFit.contain,
                          width: 50.w,
                          height: 50.h,
                        );
                      },
                      // height: 100,
                      fit: BoxFit.cover,
                      placeholder:
                          const AssetImage("assets/sample_images/pagelogo.png"),
                      image: Image.network(
                        eventModel.photos.toString(),
                      ).image,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.greyColor3d,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.r),
                            topRight: Radius.circular(25.r),
                          )),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 30.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const Row(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50.h,
                                  width: 260.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40.r),
                                      color: const Color(0xff142303)),
                                  child: Center(
                                    child: CText(
                                      text: DateFormat.yMEd().add_jms().format(
                                          DateTime.parse(eventModel
                                              .eventcreateddate
                                              .toString())),
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 12.h),
                              height: 50.h,
                              // width: 260.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40.r),
                                  color: const Color(0xff142303)),
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.pin_drop,
                                    color: AppColors.primaryyellowColor,
                                  ),
                                  CText(
                                    text: eventModel.address1.toString(),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: 12.h),
                              child: CText(
                                text: eventModel.eventName.toString(),
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.whitesoftColor,
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: 11.h),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.pin_drop,
                                    color: AppColors.primaryyellowColor,
                                  ),
                                  SizedBox(width: 10.w),
                                  CText(
                                    text: eventModel.address1.toString(),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16.h, bottom: 20.h),
                              child: const Divider(color: Colors.grey),
                            ),
                            CText(
                              text: 'Descriptions',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.greyColor,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: ReadMoreText(
                                eventModel.description.toString(),
                                trimLines: 3,
                                // colorClickableText: Colors.green,
                                trimMode: TrimMode.Line,
                                lessStyle: TextStyle(
                                    color: AppColors.grey, fontSize: 10.sp),
                                moreStyle: TextStyle(
                                  color: AppColors.red,
                                  fontSize: 10.sp,
                                ),
                                trimCollapsedText: 'Show more',
                                trimExpandedText: 'Show less',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16.h, bottom: 20.h),
                              child: const Divider(color: Colors.grey),
                            ),

                            CText(
                              text: 'Owner',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.greyColor,
                            ),
                            ListTile(
                              onTap: () {
                                // Get.to(() => PageScreen(userDetailedID: eventModel));
                                // Get.toNamed("/page_screen",
                                //     arguments: {'userDetailedID': eventModel});
                              },
                              leading: FadeInImage(
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Image.asset(
                                    "assets/sample_images/pagelogo.png",
                                    fit: BoxFit.contain,
                                    width: 50.w,
                                    height: 50.h,
                                  );
                                },
                                // height: 100,
                                fit: BoxFit.cover,
                                placeholder: const AssetImage(
                                    "assets/sample_images/pagelogo.png"),
                                image: Image.network(
                                  eventModel.profileImage.toString(),
                                ).image,
                              ),

                              // eventModel.profileImage.toString() == null
                              //     ? const Image(
                              //         image:
                              //             AssetImage('assets/sample_images/pagelogo.png'),
                              //       )
                              //     : SizedBox(
                              //         height: 50.h,
                              //         width: 50.w,
                              //         child: Image(
                              //           image: NetworkImage(eventModel.profileImage!),
                              //         ),
                              //       ),
                              title: Text(
                                eventModel.userid.toString(),
                                style: TextStyle(
                                  color: MediaQuery.of(context)
                                              .platformBrightness ==
                                          Brightness.light
                                      ? AppColors.whitesoftColor
                                      : AppColors.primaryyellowColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                DateFormat.yMEd().add_jms().format(
                                    DateTime.parse(eventModel.eventcreateddate
                                        .toString())),
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),

                            FirebaseAuth.instance.currentUser != null
                                ? Padding(
                                    padding: EdgeInsets.only(top: 25.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        controller.buyTicketBool.value == true
                                            ? const CircularProgressIndicator()
                                            : PrimaryButton(
                                                text: 'Add',
                                                onTap: () {
                                                  if (FirebaseAuth.instance
                                                          .currentUser !=
                                                      null) {
                                                    log('Button taped');
                                                    List newListcreated = eventModel
                                                                .totalTicketBuyers ==
                                                            null
                                                        ? []
                                                        : eventModel
                                                            .totalTicketBuyers!;
                                                    log('old list length   === ${newListcreated.length}');

                                                    newListcreated.add({
                                                      'UserId': FirebaseAuth
                                                          .instance
                                                          .currentUser!
                                                          .uid,
                                                      'UserName': FirebaseAuth
                                                          .instance
                                                          .currentUser!
                                                          .displayName,
                                                      'UserImage': FirebaseAuth
                                                          .instance
                                                          .currentUser!
                                                          .photoURL,
                                                    });
                                                    controller
                                                        .fetchDocumentFields(
                                                            FirebaseAuth
                                                                .instance
                                                                .currentUser!
                                                                .uid);
                                                    controller.buyTicket(
                                                        newListcreated,
                                                        eventModel
                                                            .eventUniqueId);
                                                  } else {
                                                    log('LOged in first');
                                                  }
                                                },
                                                width: 150.w,
                                              ),
                                        PrimaryButton(
                                          text: 'reject',
                                          onTap: () {},
                                          width: 150.w,
                                        ),
                                      ],
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.only(top: 25.h),
                                    child: PrimaryButton(
                                      text: 'Sign in',
                                      onTap: () {},
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }));
  }
}
