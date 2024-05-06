import 'package:chiblane/utils/app_color.dart';
import 'package:chiblane/utils/styles/textfield_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// final obscureProvider = StateProvider<bool>((ref) => true);
final obscureProvider = true.obs;

// typedef StringValidationCallback = String Function(String);
class AppTextfields {
  static Widget myTextField({
    required TextEditingController controller,
    required String lable,
    IconData? leadingicon,
    IconData? trailingicon,
    VoidCallback? ontap,
    TextInputAction? textInputAction,
    TextInputType? textInputType,

    // StringValidationCallback? validation,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: TextFormField(
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: textInputType ?? TextInputType.text,
        textInputAction: textInputAction ?? TextInputAction.next,
        showCursor: true,
        enableIMEPersonalizedLearning: true,

        enableInteractiveSelection: true,
        // style: AppTextStyles.normalLable,
        decoration: mytextfieldDecoration(
          lable: lable,
          trailingicon: trailingicon,
        ),
        onTap: ontap,
        validator: (value) {
          // const pattern = (r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
          // final regExp = RegExp(pattern);
          if (
              // value!.contains(' ') ||
              value!.isEmpty) {
            return "Can't have blank or Empty spaces";
          } else {
            return null;
          }
        },
      ),
    );
  }

  static Widget passwordField({
    required TextEditingController controller,
    TextInputAction? textInputAction,
  }) {
    final obscureProvider = true.obs;
    return Obx(
      () => Padding(
        padding: EdgeInsets.only(bottom: 5.h),
        child: TextFormField(
          controller: controller,
          obscureText: obscureProvider.value,
          keyboardType: TextInputType.visiblePassword,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onEditingComplete: () => TextInput.finishAutofillContext(),
          textInputAction: textInputAction ?? TextInputAction.done,
          // style: AppTextStyles.normalBody,
          decoration: InputDecoration(
            // isDense: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 10.w,
            ),
            fillColor: AppColors.greyColor3d,
            filled: true,

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            //     borderSide:
            //         BorderSide(color: AppColors.myPrimary.withOpacity(0.5))),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            // enabledBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(50),
            //     borderSide: const BorderSide(color: AppColors.grey959E)),
            // border: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(50),
            //     borderSide:
            //         BorderSide(color: AppColors.myPrimary.withOpacity(0.5))),
            // focusedBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(50),
            //     borderSide: const BorderSide(color: AppColors.myPrimary)),
            // prefixIcon: Icon(
            //   Icons.lock,
            //   color: AppColors.myPrimary.withOpacity(0.8),
            // ),
            // prefixIconConstraints: const BoxConstraints(
            //   maxHeight: 24,
            //   maxWidth: 40,
            //   minWidth: 40,
            // ),
            hintText: "Type here...",

            hintStyle: TextStyle(color: AppColors.greyColor, fontSize: 16.sp),
            floatingLabelStyle:
                TextStyle(color: AppColors.greyColor, fontSize: 16.sp),
            suffixIcon: IconButton(
                onPressed: () {
                  obscureProvider.value = !obscureProvider.value;
                  // ref.read(obscureProvider.notifier).state = !obscureText;
                },
                icon: Icon(
                  obscureProvider.isTrue
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: AppColors.primarybackColor,
                )),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please fill all Form';
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }

  static Widget sharpCornerTextField({
    required TextEditingController controller,
    required BuildContext context,
    required String lable,
    TextInputAction? textInputAction,
    TextInputType? textInputType,
  }) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: textInputType ?? TextInputType.emailAddress,
        textInputAction: textInputAction ?? TextInputAction.next,
        enableInteractiveSelection: true,
        showCursor: true,
        // style: AppTextStyles.normalBody,
        decoration: InputDecoration(
          fillColor:
              MediaQuery.of(context).platformBrightness == Brightness.light
                  ? AppColors.appbackgroundColor
                  : AppColors.appbackgroundColor,
          filled: true,

          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          enabledBorder: InputBorder.none,
          // OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(0),
          //     borderSide: const BorderSide(color: AppColors.icongrey7C7C)),
          border: InputBorder.none,
          // OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(0),
          //     borderSide:
          //         BorderSide(color: AppColors.myPrimary.withOpacity(0.5))),
          focusedBorder: InputBorder.none,
          // OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(0),
          //     borderSide: const BorderSide(color: AppColors.myPrimary)),
          // labelText: lable,
          hintText: lable,
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.primarybackColor,
          ),
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 24,
            maxWidth: 40,
            minWidth: 40,
          ),
          hintStyle:
              TextStyle(color: AppColors.whitesoftColor, fontSize: 16.sp),
          // labelStyle: TextStyle(color: AppColors.navbariconF0FD, fontSize: 13),
          // floatingLabelStyle: TextStyle(
          //     color: AppColors.myPrimary.withOpacity(0.85), fontSize: 13),
        ),
      ),
    );
  }

  static Widget myMultiLineTextField({
    required TextEditingController controller,
    required String lable,
    IconData? leadingicon,
    IconData? trailingicon,
    VoidCallback? ontap,
    TextInputAction? textInputAction,
    TextInputType? textInputType,

    // StringValidationCallback? validation,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: TextFormField(
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: textInputType ?? TextInputType.multiline,
        textInputAction: textInputAction ?? TextInputAction.next,
        showCursor: true,
        enableIMEPersonalizedLearning: true,

        enableInteractiveSelection: true,
        // style: AppTextStyles.normalLable,
        decoration: mytextfieldDecoration(
          lable: lable,
          trailingicon: trailingicon,
        ),

        maxLines: null,
        minLines: 4,
        textAlignVertical: const TextAlignVertical(y: -1),
        onTap: ontap,
        validator: (value) {
          // const pattern = (r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
          // final regExp = RegExp(pattern);
          if (
              // value!.contains(' ') ||
              value!.isEmpty) {
            return "Can't have blank or Empty spaces";
          } else {
            return null;
          }
        },
      ),
    );
  }

  // static Widget promotionTextField({
  //   required TextEditingController controller,
  //   required BuildContext context,
  //   required String lable,
  //   TextInputAction? textInputAction,
  //   TextInputType? textInputType,
  //   required VoidCallback onApply,
  // }) {
  //   return TextFormField(
  //     controller: controller,
  //     autovalidateMode: AutovalidateMode.onUserInteraction,
  //     keyboardType: textInputType ?? TextInputType.emailAddress,
  //     textInputAction: textInputAction ?? TextInputAction.next,
  //     enableInteractiveSelection: true,
  //     showCursor: true,
  //     // style: AppTextStyles.normalBody,
  //     decoration: InputDecoration(
  //       fillColor: MediaQuery.of(context).platformBrightness == Brightness.light
  //           ? AppColors.white
  //           : AppColors.dTmyPrimary,
  //       filled: true,

  //       contentPadding:
  //           const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
  //       enabledBorder: //InputBorder.none,
  //           OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(8),
  //               borderSide: const BorderSide(color: AppColors.icongrey7C7C)),
  //       border: //InputBorder.none,
  //           OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(8),
  //               borderSide:
  //                   BorderSide(color: AppColors.myPrimary.withOpacity(0.5))),
  //       focusedBorder: //InputBorder.none,
  //           OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(8),
  //               borderSide: const BorderSide(color: AppColors.myPrimary)),
  //       // labelText: lable,
  //       hintText: lable,
  //       suffixIcon: TextButton(
  //         onPressed: onApply,
  //         child: const Text(
  //           "Apply",
  //           style: TextStyle(color: AppColors.blue),
  //         ),
  //       ),
  //       // prefixIcon: const Icon(
  //       //   Icons.search,
  //       //   color: AppColors.navbariconF0FD,
  //       // ),
  //       // prefixIconConstraints: const BoxConstraints(
  //       //   maxHeight: 24,
  //       //   maxWidth: 40,
  //       //   minWidth: 40,
  //       // ),
  //       hintStyle:
  //           const TextStyle(color: AppColors.navbariconF0FD, fontSize: 13),
  //       // labelStyle: TextStyle(color: AppColors.navbariconF0FD, fontSize: 13),
  //       // floatingLabelStyle: TextStyle(
  //       //     color: AppColors.myPrimary.withOpacity(0.85), fontSize: 13),
  //     ),
  //   );
  // }
}
