import 'dart:developer';
import 'package:chiblane/green_auth/signin_screen.dart';
import 'package:chiblane/green_view/event_details.dart';
import 'package:chiblane/utils/app_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';
import '../model_view/event_view_model.dart';
import '../models/event_model.dart';
import 'primary_button.dart';
import 'text_widget.dart';

bool commentval = false;

// ignore: must_be_immutable
class HomeWidget extends StatelessWidget {
  EventModel eventModel;
  bool likeNum;
  bool savedNum;
  HomeWidget({
    super.key,
    required this.eventModel,
    required this.likeNum,
    required this.savedNum,
  });

  TextEditingController homeCommentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final eventController = Get.put(EventViewModel());
    return GestureDetector(
      onTap: () {
        Get.to(() => EventDetailScreen(eventModel: eventModel));
        // log('current user Id = ${FirebaseAuth.instance.currentUser!.uid}');
        // log('event wwala bab === ${eventModel.userid}');
        // Get.toNamed("/eventDetailScreen");
        // eventController.updateEventModelIndex(eventModel);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r), color: AppColors.grey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
                onTap: () {
                  // Get.to(() => PageScreen(userDetailedID: eventModel));
                  // Get.toNamed("/page_screen",
                  //     arguments: {'userDetailedID': eventModel});
                },
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(eventModel.profileImage.toString()),
                ),

                // FadeInImage(
                //   imageErrorBuilder: (context, error, stackTrace) {
                //     return Image.asset(
                //       "assets/sample_images/pagelogo.png",
                //       fit: BoxFit.contain,
                //       width: 50.w,
                //       height: 50.h,
                //     );
                //   },
                //   // height: 100,
                //   fit: BoxFit.cover,
                //   placeholder:
                //       const AssetImage("assets/sample_images/pagelogo.png"),
                //   image: Image.network(
                //     eventModel.profileImage.toString(),
                //   ).image,
                // ),

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
                  eventModel.name == null || eventModel.name!.isEmpty
                      ? 'User'
                      : eventModel.name.toString(),
                  style: TextStyle(
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? AppColors.whitesoftColor
                        : AppColors.primaryyellowColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  DateFormat.yMEd().add_jms().format(
                      DateTime.parse(eventModel.eventcreateddate.toString())),
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300),
                ),
                trailing: const Icon(
                  Icons.more_horiz_outlined,
                  size: 20,
                )),
            Padding(
              padding: EdgeInsets.only(right: 15.w, left: 15.w, top: 7.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CText(
                    text: 'Hey Green Community!',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  ReadMoreText(
                    eventModel.description.toString(),
                    trimLines: 2,
                    // colorClickableText: Colors.green,
                    trimMode: TrimMode.Line,
                    lessStyle:
                        TextStyle(color: AppColors.grey, fontSize: 10.sp),
                    moreStyle: TextStyle(
                      color: AppColors.red,
                      fontSize: 10.sp,
                    ),
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.h),
                    height: 250.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      image: DecorationImage(
                        image: NetworkImage(
                          eventModel.photos.toString(),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(top: 4.h),
                  //   child: CText(
                  //     text: eventModel.eventName.toString(),
                  //     fontSize: 12.sp,
                  //     fontWeight: FontWeight.bold,
                  //     // color: Colors.black87,
                  //   ),
                  // ),
                  // CText(
                  //   // text: 'Mon, 4 Dec at 10:00 MST',
                  //   text: '${eventModel.startDate}  /  ${eventModel.startTime}',
                  //   fontSize: 10.sp,
                  //   fontWeight: FontWeight.w300,
                  //   // color: Colors.black87,
                  // ),
                  // CText(
                  //   // text: 'Library Main Campus',
                  //   text: eventModel.address1.toString(),
                  //   fontSize: 10.sp,
                  //   fontWeight: FontWeight.w300,
                  //   // color: Colors.black87,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 47.w,
                              height: 30.h,
                              child: const Image(
                                image: AssetImage(
                                  'assets/app_images/likesImage.png',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: CText(
                                text: eventModel.listofLikes == null
                                    ? '0'
                                    : eventModel.listofLikes!.length.toString(),
                                //' Participate now & earn',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 47.w,
                              height: 30.h,
                              child: const Image(
                                image: AssetImage(
                                  'assets/app_images/peopleparticipent.png',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: CText(
                                text: eventModel.totalTicketBuyers!.isEmpty
                                    ? '0 People Participated'
                                    : "${eventModel.listofLikes!.length.toString()} People Participated",
                                //' Participate now & earn',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
                        child: CText(
                          text: 'Participate now & earn',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
                        child: CText(
                          text: 'Points Earned',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      eventController.buyTicketBool.value == true
                          ? const CircularProgressIndicator()
                          : PrimaryButton(
                              text: 'Participate Now',
                              onTap: () {
                                if (FirebaseAuth.instance.currentUser != null) {
                                  log('Button taped');
                                  List newListcreated =
                                      eventModel.totalTicketBuyers == null
                                          ? []
                                          : eventModel.totalTicketBuyers!;
                                  log('old list length   === ${newListcreated.length}');

                                  newListcreated.add({
                                    'UserId':
                                        FirebaseAuth.instance.currentUser!.uid,
                                    'UserName': FirebaseAuth
                                        .instance.currentUser!.displayName,
                                    'UserImage': FirebaseAuth
                                        .instance.currentUser!.photoURL,
                                  });
                                  eventController.fetchDocumentFields(
                                      FirebaseAuth.instance.currentUser!.uid);
                                  eventController.buyTicket(
                                      newListcreated, eventModel.eventUniqueId);
                                } else {
                                  log('LOged in first');
                                  Get.to(() => const SigninScreen());
                                }
                              },
                              width: 230.w,
                              color: AppColors.greenColor635,
                            ),
                      Container(
                        height: 55.h,
                        width: 110.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.r),
                          gradient: AppColors.linearGradient,
                        ),
                        child: Center(
                          child: CText(
                            text: '247 Pts',
                            fontSize: 16.sp,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15.w, left: 15.w, top: 7.h),
              child: const Divider(),
            ),
            Container(
              margin: EdgeInsets.only(top: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
                // color: MediaQuery.of(context).platformBrightness ==
                //         Brightness.light
                //     ? AppColors.green
                //     : AppColors.primaryyellowColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Like
                      RichText(
                          text: WidgetSpan(
                              child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              eventController.checkUserExistinLikeList(
                                eventModel.listofLikes!,
                                eventModel.userid,
                                eventModel,
                              );
                            },
                            icon: Icon(
                              Icons.thumb_up_alt_outlined,
                              color: likeNum
                                  ? AppColors.greenColor635
                                  : AppColors.whitesoftColor,
                              size: 25.sp,
                            ),
                          ),
                          Text(
                            // eventModel.listofLikes == null
                            //     ? '0'
                            //     : eventModel.listofLikes!.length.toString(),
                            'Like',
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ))),
                      // // Comment

                      // Padding(
                      //   padding: EdgeInsets.only(left: 20.w),
                      //   child: RichText(
                      //       text: WidgetSpan(
                      //           child: Row(
                      //     children: [
                      //       IconButton(
                      //         onPressed: () {
                      //           // savedEvent
                      //           // eventController.checkUserExistinSavedList(
                      //           //   eventModel.listofComments!,
                      //           //   eventModel.userid,
                      //           //   eventModel,
                      //           // );
                      //         },
                      //         icon: Icon(
                      //           Icons.bookmark,
                      //           color: savedNum
                      //               ? AppColors.red
                      //               : AppColors.greyColor3d,
                      //           size: 25.sp,
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: EdgeInsets.only(left: 5.w),
                      //         child: Text(
                      //           eventModel.listofComments == null
                      //               ? '0'
                      //               : eventModel.listofComments!.length
                      //                   .toString(),
                      //           style: Theme.of(context).textTheme.bodySmall,
                      //         ),
                      //       )
                      //     ],
                      //   ))),
                      // ),

                      // Comment
                      // Padding(
                      //   padding: EdgeInsets.only(left: 20.w),
                      //   child: RichText(
                      //       text: WidgetSpan(
                      //           child: Row(
                      //     children: [
                      //       IconButton(
                      //         onPressed: () async {
                      //           // commentval = true;
                      //           // log(commentval.toString());
                      //         },
                      //         icon: Icon(
                      //           Icons.comment,
                      //           color: AppColors.whitesoftColor,
                      //           size: 25.sp,
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: EdgeInsets.only(left: 5.w),
                      //         child: const Text(
                      //           // eventModel.listofrealComment == null
                      //           //     ? '0'
                      //           //     : eventModel.listofrealComment!.length
                      //           //         .toString(),
                      //           'Comment',
                      //           style:
                      //               TextStyle(color: AppColors.whitesoftColor),
                      //         ),
                      //       )
                      //     ],
                      //   ))),
                      // ),

                      //shear
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: RichText(
                            text: WidgetSpan(
                                child: Row(
                          children: [
                            IconButton(
                              onPressed: () async {
                                await Share.share(
                                  eventModel.eventName.toString(),
                                );
                                eventController.shearEventFun(
                                    eventModel.listofShear!,
                                    eventModel.userid,
                                    eventModel);
                              },
                              icon: const Icon(
                                Icons.screen_share_rounded,
                                color: AppColors.whitesoftColor,
                                size: 30,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 0.w),
                              child: const Text(
                                'Share',
                                // eventModel.listofShear == null
                                //     ? '0'
                                //     : eventModel.listofShear!.length.toString(),
                                style:
                                    TextStyle(color: AppColors.whitesoftColor),
                              ),
                            )
                          ],
                        ))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
