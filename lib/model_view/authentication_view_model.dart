import 'dart:developer';
import 'dart:io';
import 'package:chiblane/green_auth/signin_screen.dart';
import 'package:chiblane/green_auth/signup_screen.dart';
import 'package:chiblane/green_view/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../utils/appTextfield_controller.dart';
// import 'package:chiblane/utils/sheare_service.dart';

class AuthenticationViewModel extends GetxController {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('userGreen');

  final FirebaseAuth auth = FirebaseAuth.instance;

  static String? errorMessage;
  RxBool sinUpBool = false.obs;
  RxBool sinInBool = false.obs;
  RxBool signOutBool = false.obs;
  RxBool forgetPasswordBool = false.obs;
  String? uerid;
  Rx<String> userProfileImage = "".obs;
  RxString userDetailedID = "".obs;
  Location location = Location();
  RxString latitudeValue = ''.obs;
  RxString longitudeValue = ''.obs;

  RxBool pushNotificationBool = false.obs;
  RxBool locationAccessInfoBool = false.obs;
  RxString verificationCode = ''.obs;
  RxString verificationID = ''.obs;
  RxString phoneNumVal = ''.obs;
  RxString ticketCountry = ''.obs;
  RxBool verifyPhoneNum = false.obs;
  final loading = false.obs;

  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');
  XFile? selectedImage;
  setLoading(value) {
    loading.value = value;
    update();
  }

  // Verify Phone Type
  verifyPhoneFun(String userValue) {
    phoneNumVal.value = userValue;
    log('phoneController.text === ${phoneNumVal.value}');
    update();
  }

  // verifyUserPhoneNumber
  void verifyUserPhoneNumber() {
    verifyPhoneNum.value = true;
    update();
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumVal.value,
      // phoneNumber: '+92 30475765067',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        log('exception === ${e.code}');
        Fluttertoast.showToast(msg: e.code.toString());

        verifyPhoneNum.value = false;
        update();
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationID.value = verificationId;
        log('verificationId ==== $verificationID');
        verifyPhoneNum.value = false;
        update();
        // Get.to(() => const NumberVerificationScreen());
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verifyPhoneNum.value = false;
        update();
        // AppToast.failToast('Time Out');
      },
    );
  }

// Verify OTP
  Future<void> verifyOTPCode() async {
    setLoading(true);
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationID.value,
      // verificationId: '883051',
      smsCode: verificationCode.value,
    );

    await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      log('User Login In Successful');
      signUp();
    }).catchError((error) {
      Fluttertoast.showToast(msg: 'Code Not True ');
      setLoading(false);
    });
    setLoading(false);
  }

  //SignIn
  Future<void> signIn() async {
    try {
      sinInBool.value = true;
      update();
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: AppTextfieldControllers.signInEmail.text.trim(),
            password: AppTextfieldControllers.signInPassword.text.trim(),
          )
          .then((user) => {
                log('Signin succesfully'),

                // ShearedprefService.setUserID(user.user!.uid),
                // SharePrefServices.saveLoggeIn(true),
                sinInBool.value = false,
                log('user data = ${user.toString()}'),
                // navBarProvider.value = 0,
                // Get.toEnd(() => const MyBottomBar()),
                Get.to(() => const HomeScreen()),
                // Get.offAndToNamed("/myBottomBarScreen"),
                update(),
              });

      // ignore: body_might_complete_normally_catch_error
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address is invalid.";

          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "your password or email address is invalid";
      }
      Fluttertoast.showToast(msg: errorMessage.toString());
      log(errorMessage.toString());

      sinInBool.value = false;
      update();
    }
  }

  // SignUp-----------------------------------------
  Future<void> signUp() async {
    try {
      sinUpBool.value = true;
      update();
      log('Signup start =========');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: AppTextfieldControllers.signUpEmail.text,
            password: AppTextfieldControllers.signUpPassword.text,
          )
          .then((value) => {
                log("User Created_________"),
                addUser(),
              });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address is invalid";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        case "email-already-in-use":
          errorMessage =
              " The email address is already in use by another account.";
          break;
        case "weak-password":
          errorMessage = "Password should be at least 6 characters";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage.toString());
      log(errorMessage.toString());
      log('Signup FirebaseAuthException  =========$error');
      sinUpBool.value = false;
      update();
    }
  }

  // SignOut
  Future<void> signOut() async {
    signOutBool.value = true;
    await FirebaseAuth.instance.signOut().then((value) {
      // ShearedprefService.setUserLoggedIn(false);
      // ShearedprefService.setUserID('');
      // signOutBool.value = false;
      // Get.toNamed("/welcomeScreen");
      Get.toEnd(() => SignupScreen());
      log('Sign out succesfully');
    }).catchError((e) {
      log('Signout Error  =========$e');
      Fluttertoast.showToast(msg: 'Error: $e');
      signOutBool.value = false;
    });
  }

  //password Change
  passwordChange(String password) async {
    try {
      await FirebaseAuth.instance.currentUser!
          .updatePassword(password)
          .then((value) {
        log('Password updated succesfully');
        signOut();
      });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address is invalid.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "your password or email address is invalid";
      }

      return "false";
    }
  }

//  Forget Password
  Future<void> forgetPassword(String email) async {
    forgetPasswordBool.value = true;
    update();
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email)
          .then((value) {
        Fluttertoast.showToast(msg: 'Email Send for Password Reset');
        AppTextfieldControllers.forgetPassword.clear();
        Get.toNamed("/welcomeScreen");
        forgetPasswordBool.value = false;
        update();
      });
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: error.message.toString());
      forgetPasswordBool.value = false;
      update();
    }
  }

  clearTextFields() {
    AppTextfieldControllers.signUpEmail.clear();
    AppTextfieldControllers.signInEmail.clear();
    AppTextfieldControllers.signUpPassword.clear();
    AppTextfieldControllers.signUpConfirmPassword.clear();
    AppTextfieldControllers.signupUseName.clear();
    update();
  }

  Future<void> addUser() async {
    log('user is Adding....... ');
    try {
      var img = await storeUserImage(File(selectedImage!.path));
      userCollection.doc(auth.currentUser!.uid).set({
        "uid": auth.currentUser!.uid,
        'email': AppTextfieldControllers.signUpEmail.text,
        'password': AppTextfieldControllers.signUpPassword.text,
        'userName': AppTextfieldControllers.signupUseName.text,
        'userScore': 0,
        'img': img,
      }).then((value) async {
        log("user Added");
        // FirebaseAuth.instance.currentUser!.updateDisplayName(
        //     "${AppTextfieldControllers.signUpFirstName.text} ${AppTextfieldControllers.signUpLastName.text}");

        // await signIn(
        //     singinKey: true,
        //     emailSignINVal: AppTextfieldControllers.signUpEmail.text,
        //     passwordSinginVal: AppTextfieldControllers.signUpPassword.text);
        // Get.toNamed("/welcomeScreen");
        Get.to(() => const SigninScreen());
        sinUpBool.value = false;
        clearTextFields();
        update();
      }).catchError((error) {
        log("Failed to add Product: $error");
        Fluttertoast.showToast(msg: "Error : $error");
        sinUpBool.value = false;
        update();
      });
      Fluttertoast.showToast(msg: "User Created Succesfully");
    } catch (e) {
      Fluttertoast.showToast(msg: "Error : $e");
      log('Error = $e');
      sinUpBool.value = false;
      update();
    }
  }

  storeUserImage(File imageFile) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(imageFile);
    try {
      await uploadTask;
      String? imageUrl;
      await ref.getDownloadURL().then((value) async {
        imageUrl = value;
        await updateUserimage(imageUrl!);
        log('User Profile Pic updated Successfully====');
        log(imageUrl!);
      });

      await updateUserimage(imageUrl ?? "");
      return imageUrl;
    } catch (e) {
      log('Error uploading image: $e');
      // return '';
    }
  }

  updateUserimage(String url) {
    userProfileImage.value = url;
    FirebaseAuth.instance.currentUser!.updatePhotoURL(url);
    log('photiooo === ${FirebaseAuth.instance.currentUser!.photoURL.toString()}');
    update();
  }

//  Pick File
  Future<void> pickImages() async {
    final ImagePicker imagePicker = ImagePicker();
    selectedImage = (await imagePicker.pickImage(source: ImageSource.gallery))!;
    log('Image Picked');
    log(selectedImage!.path.toString());
    update();
  }

// get User Current location
  Future<void> getCurrentLocation() async {
    try {
      LocationData locationData = await location.getLocation();
      latitudeValue.value = locationData.latitude!.toString();
      longitudeValue.value = locationData.longitude!.toString();
      // LatLng(locationData.latitude!, locationData.longitude!);
      log('latitude === ${latitudeValue.value}');
      log('longitude === ${longitudeValue.value}');
      update();
    } catch (e) {
      log("Error: $e");
    }
  }
}
