import 'dart:developer';
import 'dart:io';
import 'package:chiblane/green_auth/signin_screen.dart';
import 'package:chiblane/model_view/event_view_model.dart';
import 'package:chiblane/utils/app_color.dart';
import 'package:chiblane/utils/app_textfield.dart';
import 'package:chiblane/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../utils/appTextfield_controller.dart';
import '../widgets/primary_button.dart';

class AddEventScreen extends StatelessWidget {
  const AddEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CText(
            text: 'New Event',
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: GetBuilder<EventViewModel>(
            init: EventViewModel(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Form(
                    key: addEventformkey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.pickImages();
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 25.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CText(
                                    text: 'Picture of Event',
                                    fontSize: 16.sp,
                                    color: AppColors.whitesoftColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(top: 12.h),
                                      child: controller.selectedImage != null
                                          ? Container(
                                              height: 100.h,
                                              width: Get.width,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: FileImage(File(
                                                          controller
                                                              .selectedImage!
                                                              .path))),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.r),
                                                  color: AppColors.greyColor3d),
                                            )
                                          : Container(
                                              height: 100.h,
                                              width: Get.width,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.r),
                                                  color: AppColors.greyColor3d),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.photo,
                                                  color: AppColors
                                                      .appbackgroundColor,
                                                ),
                                              ),
                                            )),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CText(
                                  text: 'Name of Event',
                                  fontSize: 16.sp,
                                  color: AppColors.whitesoftColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 12.h),
                                  child: AppTextfields.myTextField(
                                      controller: controller.nameofEvent,
                                      lable: 'Type here...'),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25.h),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CText(
                                    text: 'Date',
                                    fontSize: 16.sp,
                                    color: AppColors.whitesoftColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 12.h),
                                    child: AppTextfields.myTextField(
                                      controller: controller.dateofEvent,
                                      lable: "MM/DD/YYYY",
                                      trailingicon: Icons.calendar_month,
                                      textInputAction: TextInputAction.none,
                                      ontap: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1950),
                                                lastDate: DateTime(2500));

                                        if (pickedDate != null) {
                                          log(pickedDate.toString());
                                          String formattedDate =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(pickedDate);
                                          controller
                                              .updateDateofEvent(formattedDate);
                                          log(formattedDate);
                                        } else {
                                          log('Picked valued first');
                                        }
                                      },
                                    ),
                                  ),
                                ]),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25.h),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CText(
                                    text: 'Time',
                                    fontSize: 16.sp,
                                    color: AppColors.whitesoftColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 12.h),
                                    child: AppTextfields.myTextField(
                                      controller: controller.timeEvent,
                                      textInputAction: TextInputAction.none,
                                      textInputType: TextInputType.none,
                                      lable: "Select time",
                                      trailingicon: Icons.watch_later_outlined,
                                      ontap: () async {
                                        TimeOfDay initialTime = TimeOfDay.now();
                                        TimeOfDay? pickedTime =
                                            await showTimePicker(
                                          context: context,
                                          initialTime: initialTime,
                                        );
                                        controller.updateTimefEvent(
                                          // ignore: use_build_context_synchronously
                                          pickedTime!
                                              // ignore: use_build_context_synchronously
                                              .format(context)
                                              .toString(),
                                        );
                                      },
                                    ),
                                  ),
                                ]),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25.h),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CText(
                                    text: 'Add location',
                                    fontSize: 16.sp,
                                    color: AppColors.whitesoftColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 12.h),
                                    child: AppTextfields.myTextField(
                                      controller: controller.locationEvent,
                                      // textInputAction: TextInputAction.none,
                                      // textInputType: TextInputType.none,
                                      lable: "Add location",
                                      trailingicon: Icons.location_searching,
                                      // ontap: () async {},
                                    ),
                                  ),
                                ]),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25.h),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CText(
                                    text: 'Add Decription',
                                    fontSize: 16.sp,
                                    color: AppColors.whitesoftColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 12.h),
                                    child: AppTextfields.myMultiLineTextField(
                                      controller: controller.descriptionEvent,
                                      // textInputAction: TextInputAction.none,
                                      // textInputType: TextInputType.none,
                                      lable: "Add here ",
                                      // trailingicon: Icons.watch_later_outlined,
                                      // ontap: () async {},
                                    ),
                                  ),
                                ]),
                          ),
                          controller.eventBool.value == true
                              ? const CircularProgressIndicator()
                              : Padding(
                                  padding: EdgeInsets.only(top: 25.h),
                                  child: PrimaryButton(
                                    text: 'Create Event',
                                    onTap: () {
                                      if (addEventformkey.currentState!
                                          .validate()) {
                                        if (FirebaseAuth.instance.currentUser !=
                                            null) {
                                          controller.createEvent();
                                        } else {
                                          Get.to(() => const SigninScreen());
                                        }
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: 'Enter Fields !!');
                                      }
                                    },
                                  ),
                                ),
                        ],
                      ),
                    )),
              );
            }));
  }
}
