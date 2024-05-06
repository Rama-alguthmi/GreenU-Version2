import 'package:flutter/material.dart';

class AppTextfieldControllers {
  static final TextEditingController signupUseName = TextEditingController();
  static final TextEditingController signInEmail = TextEditingController();
  static final TextEditingController signInPassword = TextEditingController();
  static final TextEditingController signUpEmail = TextEditingController();
  static final TextEditingController signUpPassword = TextEditingController();
  static final TextEditingController signUpConfirmPassword =
      TextEditingController();
  static final TextEditingController forgetPassword = TextEditingController();
  static final TextEditingController homeSearch = TextEditingController();
  static final TextEditingController nameofEvent = TextEditingController();
  static final TextEditingController dateofEvent = TextEditingController();
}

final sigupformkey = GlobalKey<FormState>();
final siginformkey = GlobalKey<FormState>();
final addEventformkey = GlobalKey<FormState>();
