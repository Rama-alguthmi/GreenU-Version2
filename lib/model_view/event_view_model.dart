import 'dart:developer';
import 'dart:io';
import 'package:chiblane/green_view/home_page.dart';
import 'package:chiblane/models/event_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class EventViewModel extends GetxController {
// collection reference
  CollectionReference eventCollection =
      FirebaseFirestore.instance.collection('eventsGreen');
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('userGreen');

  final FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController nameofEvent = TextEditingController();
  TextEditingController dateofEvent = TextEditingController();
  TextEditingController locationEvent = TextEditingController();
  TextEditingController timeEvent = TextEditingController();
  TextEditingController descriptionEvent = TextEditingController();

  updateDateofEvent(String doE) {
    dateofEvent = TextEditingController(text: doE);
    update();
  }

  updateLocationofEvent(String loE) {
    locationEvent = TextEditingController(text: loE);
    update();
  }

  updateTimefEvent(String toE) {
    timeEvent = TextEditingController(text: toE);
    update();
  }

  updateDescriptionfEvent(String doE) {
    descriptionEvent = TextEditingController(text: doE);
    update();
  }

  // TextEditingController startDateController = TextEditingController();
  // TextEditingController endDateController = TextEditingController();
  // TextEditingController addressLine1Controller = TextEditingController();
  // TextEditingController addressLine2Controller = TextEditingController();
  // TextEditingController paymentDeadlineDateController = TextEditingController();
  // TextEditingController eventDescriptionController = TextEditingController();
  // TextEditingController eventVipTicketPriceController = TextEditingController();
  // TextEditingController eventEconomyTicketPriceController =
  //     TextEditingController();

  RxList imagesList = [].obs;
  RxString eventMode = 'mode-1'.obs;
  RxString eventType = ''.obs;
  RxString eventCity = ''.obs;
  RxString eventState = ''.obs;
  RxString eventCountry = ''.obs;
  RxString ticketCountry = ''.obs;
  RxBool followBool = false.obs;

  RxBool eventBool = false.obs;
  RxBool eventDeleteBool = false.obs;
  RxBool buyTicketBool = false.obs;
  RxBool followlikeBool = false.obs;
  XFile? selectedImage;
  String finalEventImageUploadedSucces = '';

  EventModel? eventModelIndex;
  List urlImageList = [];

  RxString profileImageTaken = ''.obs;

  List<Map<String, String>> selectedcategory = [];

//  Pick File
  Future<void> pickImages() async {
    final ImagePicker imagePicker = ImagePicker();
    selectedImage = (await imagePicker.pickImage(source: ImageSource.gallery))!;
    log('Image Picked');
    log(selectedImage!.path.toString());
    if (selectedImage != null) {
      imageUpload(File(selectedImage!.path), selectedImage!.path);
    } else {
      Fluttertoast.showToast(msg: 'Image Not Uploaded');
    }

    update();
  }

// Initialize FirebaseFirestore instance
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> fetchDocumentFields(String documentId) async {
    try {
      DocumentSnapshot documentSnapshot = await _db
          .collection('userGreen') // Replace with your collection name
          .doc(documentId)
          .get();

      if (documentSnapshot.exists) {
        // Document exists, fetch fields
        Map<String, dynamic>? data =
            documentSnapshot.data() as Map<String, dynamic>?;
        if (data != null) {
          // Access document fields
          String title = data['email'];
          String subtitle = data['userName'];
          int score = data['userScore'];
          int newScore = data['userScore'] + 5;
          log('newScore ==== $newScore');
          updateUserScore(documentId, newScore);
          // Do something with the fields
          print('Title: $title, Subtitle: $subtitle, Score: $score');
        } else {
          // Handle null case
          print('Document data is null');
        }
      } else {
        // Document does not exist
        print('Document does not exist');
      }
    } catch (e) {
      // Error fetching document
      print('Error fetching document: $e');
    }
  }

  // Function to update the title field of a document by ID
  Future<void> updateUserScore(String documentId, int newScore) async {
    try {
      await _db
          .collection('userGreen') // Replace with your collection name
          .doc(documentId)
          .update({'userScore': newScore});
      log('Document title updated successfully');
    } catch (e) {
      // Error updating document
      print('Error updating document title: $e');
    }
  }

  // updateSelectedCategory(Map<String, String> catIndex) {
  //   var categoryToCheck = catIndex;
  //   bool found = false;
  //   for (var catInd in selectedcategory) {
  //     if (catInd == categoryToCheck) {
  //       found = true;
  //       break;
  //     } else {
  //       log('Not Found');
  //     }
  //   }

  //   if (found) {
  //     log('A Category with CatId $categoryToCheck found in the list.');

  //     selectedcategory.remove(categoryToCheck);
  //   } else {
  //     log('No Category with CatId $categoryToCheck found in the list.');
  //     // selectedcategory.add(catName);
  //     selectedcategory.add(catIndex);
  //     update();
  //   }
  // }

//   updateSelectedCategoryDoc(
//     String categoryId,
//     String categoryImage,
//     String categoryName,
//     String selected,
//   ) {
//     userCollection
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .collection('category')
//         .doc(categoryId)
//         .set({
//       'categoryId': categoryId,
//       'categoryImage': categoryImage,
//       'categoryName': categoryName,
//       'selected': selected,
//     }).then((_) {
//       log('category added successfully!');
//     }).catchError((error) {
//       log('Error adding category: $error');
//     });
//   }

//   deleteSelectedCategoryDoc(String categoryId) {
//     userCollection
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .collection('category')
//         .doc(categoryId)
//         .delete()
//         .then((_) {
//       log('category delete successfully!');
//     }).catchError((error) {
//       log('Error deleted category: $error');
//     });

//     // Map<String, String> data = selectedcategory.toMap();
//     update();
//   }

//   updateEventModelIndex(EventModel indexvalue) {
//     eventModelIndex = indexvalue;
//     update();
//     log(eventModelIndex!.address1.toString());
//   }

//   eventpaymentDeadlineDatweValue(String val) {
//     paymentDeadlineDateController = TextEditingController(text: val);
//     update();
//   }

//   updateTicketCountryValue(String val) {
//     ticketCountry.value = val;
//     update();
//   }

//   eventModeValue(String val) {
//     eventMode.value = val;
//     log('eventMode Type === ${eventMode.value}');
//     update();
//   }

//   eventTypeValue(String val) {
//     eventType.value = val;
//     log('Event Type === ${eventType.value}');
//     update();
//   }

//   eventCityValue(String val) {
//     eventCity.value = val;
//     update();
//   }

//   eventStateValue(String val) {
//     eventState.value = val;
//     update();
//   }

//   eventCountryValue(String val) {
//     eventCountry.value = val;
//     update();
//   }

//   updateStartTime(String timeval) {
//     startTimeController = TextEditingController(text: timeval);
//     update();
//   }

//   updateEndTime(String timeval) {
//     endTimeController = TextEditingController(text: timeval);
//     update();
//   }

//   updateStartDate(String dateVal) {
//     startDateController = TextEditingController(text: dateVal);
//     update();
//   }

//   updateEndDate(String dateVal) {
//     endDateController = TextEditingController(text: dateVal);
//     update();
//   }

  Stream<List<EventModel>> getDataFromFirestore() {
    return FirebaseFirestore.instance
        .collection('eventsGreen')
        // .where('userid', isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => EventModel.fromJson(doc)).toList());
  }

  Future<void> createEvent() async {
    log('Event is Adding....... ');
    eventBool.value = true;
    update();
    try {
      Uuid uuid = const Uuid();
      String eventUniqueId = uuid.v1();
      // await imageUpload(File(selectedImage!.path), selectedImage!.path);
      eventCollection.doc(eventUniqueId).set({
        "photos": finalEventImageUploadedSucces,
        "eventName": nameofEvent.text,
        "eventType": 'eventType.value',
        "eventMode": 'eventMode.value',
        "startDate": dateofEvent.text,
        "endDate": 'endDateController.text',
        "startTime": timeEvent.text,
        "endTime": 'endTimeController.text',
        "address1": locationEvent.text,
        "address2": 'addressLine2Controller.text',
        "city": 'eventCity.value',
        "state": 'eventState.value',
        "country": 'eventCountry.value',
        "description": descriptionEvent.text,
        "vipTicketPrice": 'eventVipTicketPriceController.text',
        "economyTicketPrice": 'eventEconomyTicketPriceController.text',
        "ticketPurchaseDeadline": 'paymentDeadlineDateController.text',
        "chosePaymentMethod": '',
        "listofLikes": <ListofLike>[],
        "listofComments": <ListofComments>[],
        "listofShear": <ListofShears>[],
        "listofrealComment": [],
        "userid": auth.currentUser!.uid,
        "name": auth.currentUser!.displayName,
        "dob": '',
        "profileImage": auth.currentUser!.photoURL,
        "ticketPaymentCountry": 'ticketCountry.value',
        "eventcreateddate": DateTime.now().toString(),
        "eventUniqueId": eventUniqueId,
        "totalTicketBuyers": [],
      }).then((value) {
        log("Event Added");
        Fluttertoast.showToast(msg: "Event Created Succesfully");
        eventBool.value = false;
        Get.to(() => const HomeScreen());
        // clearAll();
        update();
      }).catchError((error) {
        log("Failed to add Event: $error");
        Fluttertoast.showToast(msg: "Error : $error");
        eventBool.value = false;
        update();
      });
    } catch (e) {
      Fluttertoast.showToast(msg: "Error : $e");
      log('Error = $e');
      eventBool.value = false;
      update();
    }
  }

  // makeImageList() {
  //   // ignore: avoid_function_literals_in_foreach_calls
  //   imagesList.forEach((element) async {
  //     var img = await imageUpload(File(element.toString()), element);
  //     log(img);
  //     log('${img.toString()} ==============');
  //     urlImageList.add(img);
  //   });
  // }

  buyTicket(buyTicketList, eventId) {
    buyTicketBool.value = true;
    update();
    try {
      eventCollection.doc(eventId).update({
        'totalTicketBuyers': buyTicketList,
      }) // <-- Nested value
          .then((_) {
        // Get.toNamed("/myBottomBarScreen");
        Fluttertoast.showToast(msg: 'Point Added');
        buyTicketBool.value = false;
        update();
      });
    } catch (e) {
      Fluttertoast.showToast(msg: "Something went Wrong....");
      buyTicketBool.value = false;
      update();
    }
  }

//   Future<void> deleteEvent(String docUniqueId) async {
//     log('Event is deleting.......  $docUniqueId');
//     eventDeleteBool.value = true;
//     update();
//     try {
//       eventCollection.doc(docUniqueId).delete().then((value) {
//         log("Event deleted");
//         Fluttertoast.showToast(msg: "Event deleted Succesfully");
//         eventDeleteBool.value = false;
//         // Get.toNamed("/myBottomBarScreen");
//         notificationFun('Event Delete', 'You Delete an Event ');
//         update();
//       }).catchError((error) {
//         log("Failed to delete Event: $error");
//         Fluttertoast.showToast(msg: "Error : $error");
//         eventDeleteBool.value = false;
//         update();
//       });
//     } catch (e) {
//       Fluttertoast.showToast(msg: "Error : $e");
//       log('Error = $e');
//       eventDeleteBool.value = false;
//       update();
//     }
//   }

  Future<String> imageUpload(File imageFile, String name) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(name);
    UploadTask uploadTask = ref.putFile(imageFile);
    try {
      await uploadTask;
      String imageUrl = await ref.getDownloadURL();
      finalEventImageUploadedSucces = imageUrl;
      log("finalEventImageUploadedSucces ===== $finalEventImageUploadedSucces");
      return finalEventImageUploadedSucces;
    } catch (e) {
      log('Error uploading image: $e');
      return '';
    }
  }

//   clearAll() {
//     eventNameController.clear();
//     startTimeController.clear();
//     endTimeController.clear();
//     startDateController.clear();
//     endDateController.clear();
//     addressLine1Controller.clear();
//     addressLine2Controller.clear();
//     paymentDeadlineDateController.clear();
//     eventDescriptionController.clear();
//     eventVipTicketPriceController.clear();
//     eventEconomyTicketPriceController.clear();
//     imagesList.clear();
//     eventMode.value = '';
//     eventType.value = '';
//     eventCity.value = '';
//     eventState.value = '';
//     eventCountry.value = '';
//     ticketCountry.value = '';
//     // img1.value = '';
//     // img2.value = '';
//     // img3.value = '';
//     // img4.value = '';
//     update();
//   }

//   checkUserExistinSavedList(List userExist, userId, EventModel singleIndex) {
//     // Check if any userId in the list is '12345'
//     var userIdToCheck = FirebaseAuth.instance.currentUser!.uid;
//     bool found = false;
//     for (var user in userExist) {
//       if (user['UserId'] == userIdToCheck) {
//         found = true;
//         break;
//       }
//     }

//     if (found) {
//       log('A user with userId $userIdToCheck found in the list.');
//       Fluttertoast.showToast(msg: "Event Already Saved !!!!");
//     } else {
//       log('No user with userId $userIdToCheck found in the list.');
//       List newListcreated = userExist.isEmpty ? [] : userExist;
//       log('old list length   === ${newListcreated.length}');

//       newListcreated.add({
//         'UserId': FirebaseAuth.instance.currentUser!.uid,
//         'UserName': FirebaseAuth.instance.currentUser!.displayName,
//         'UserImage': FirebaseAuth.instance.currentUser!.photoURL,
//         'eventSavedDateTime': DateTime.now().toString(),
//       });

//       savedEvent(
//         singleIndex.eventUniqueId.toString(),
//         '${singleIndex.startDate}  ${singleIndex.startTime}',
//         singleIndex.eventName.toString(),
//         singleIndex.address1.toString(),
//         singleIndex.description.toString(),
//         DateTime.now().toString(),
//         singleIndex.photos!,
//         newListcreated,
//       );
//     }
//   }

//   savedEvent(
//       String eventId,
//       String eventStartDateTime,
//       String eventName,
//       String eventLocation,
//       String eventdescription,
//       String eventSavedDateTime,
//       List eventImages,
//       savedEventList) {
//     try {
//       userCollection
//           .doc(FirebaseAuth.instance.currentUser!.uid)
//           .collection('savedEvent')
//           .doc(eventId)
//           .set({
//         'eventId': eventId,
//         'eventStartDateTime': eventStartDateTime,
//         'eventName': eventName,
//         'eventLocation': eventLocation,
//         'eventdescription': eventdescription,
//         'eventSavedDateTime': eventSavedDateTime,
//         'eventImages': eventImages,
//       }).then((value) {
//         eventCollection.doc(eventId).update({
//           'listofComments': savedEventList,
//         }).then((_) {
//           log('Event saved succesfully');
//           notificationFun('Event Saved', 'You Saved an Event $eventName');
//           Fluttertoast.showToast(msg: "Event Saved !!!!");
//         });
//       });
//     } catch (e) {
//       log('Error Saved Event: $e');
//     }
//   }

  checkUserExistinLikeList(List userExist, userId, EventModel singleIndex) {
    // Check if any userId in the list is '12345'
    var userIdToCheck = FirebaseAuth.instance.currentUser!.uid;
    bool found = false;
    for (var user in userExist) {
      if (user['UserId'] == userIdToCheck) {
        found = true;
        break;
      }
    }

    if (found) {
      log('A user with userId $userIdToCheck found in the list.');
      Fluttertoast.showToast(msg: "Event Already Saved !!!!");
    } else {
      log('No user with userId $userIdToCheck found in the list.');
      List newListcreated = userExist.isEmpty ? [] : userExist;
      log('old list length   === ${newListcreated.length}');

      newListcreated.add({
        'UserId': FirebaseAuth.instance.currentUser!.uid,
        'UserName': FirebaseAuth.instance.currentUser!.displayName,
        'UserImage': FirebaseAuth.instance.currentUser!.photoURL,
        'eventSavedDateTime': DateTime.now().toString(),
      });

      // savedEvent(
      //   singleIndex.eventUniqueId.toString(),
      //   '${singleIndex.startDate}  ${singleIndex.startTime}',
      //   singleIndex.eventName.toString(),
      //   singleIndex.address1.toString(),
      //   singleIndex.description.toString(),
      //   DateTime.now().toString(),
      //   singleIndex.photos!,
      //   newListcreated,
      // );
      likeEventFun(
        singleIndex.eventUniqueId.toString(),
        newListcreated,
      );
    }
  }

  likeEventFun(
    String eventId,
    likedEventList,
  ) {
    try {
      eventCollection.doc(eventId).update({
        'listofLikes': likedEventList,
      }).then((value) {
        // notificationFun('Event Like', 'You Like an Event');
        log('event liked ADDED');
        // Fluttertoast.showToast(msg: "Event Already Saved !!!!");
      });
    } catch (e) {
      log('Error Saved Event: $e');
    }
  }

//   checkUserExistinShearList(List userExist, userId, EventModel singleIndex) {
//     // Check if any userId in the list is '12345'
//     var userIdToCheck = FirebaseAuth.instance.currentUser!.uid;
//     bool found = false;
//     for (var user in userExist) {
//       if (user['UserId'] == userIdToCheck) {
//         found = true;
//         break;
//       }
//     }

//     if (found) {
//       log('A user with userId $userIdToCheck found in the list.');
//       Fluttertoast.showToast(msg: "Event Already Saved !!!!");
//     } else {
//       log('No user with userId $userIdToCheck found in the list.');
//       List newListcreated = userExist.isEmpty ? [] : userExist;
//       log('old list length   === ${newListcreated.length}');

//       newListcreated.add({
//         'UserId': FirebaseAuth.instance.currentUser!.uid,
//         'UserName': FirebaseAuth.instance.currentUser!.displayName,
//         'UserImage': FirebaseAuth.instance.currentUser!.photoURL,
//         'eventSavedDateTime': DateTime.now().toString(),
//       });
//       likeEventFun(
//         singleIndex.eventUniqueId.toString(),
//         newListcreated,
//       );
//     }
//   }

  shearEventFun(List userExist, userId, EventModel singleIndex) {
    // Check if any userId in the list is '12345'
    var userIdToCheck = FirebaseAuth.instance.currentUser!.uid;
    bool found = false;
    for (var user in userExist) {
      if (user['UserId'] == userIdToCheck) {
        found = true;
        break;
      }
    }

    if (found) {
      log('A user with userId $userIdToCheck found in the list.');
      Fluttertoast.showToast(msg: "Event Already Saved !!!!");
    } else {
      log('No user with userId $userIdToCheck found in the list.');
      List newListcreated = userExist.isEmpty ? [] : userExist;
      log('old list length   === ${newListcreated.length}');

      newListcreated.add(
        {
          'UserId': FirebaseAuth.instance.currentUser!.uid,
          'UserName': FirebaseAuth.instance.currentUser!.displayName,
          'UserImage': FirebaseAuth.instance.currentUser!.photoURL,
          'eventSavedDateTime': DateTime.now().toString(),
        },
      );
      shearlistUpdate(singleIndex.eventUniqueId.toString(), newListcreated);
    }
  }

  shearlistUpdate(String eventId, likedEventList) {
    try {
      eventCollection.doc(eventId).update({
        'listofShear': likedEventList,
      }).then((value) {
        log('event shear ');
        // Fluttertoast.showToast(msg: "Event Already Saved !!!!");
      });
    } catch (e) {
      log('Error Saved Event: $e');
    }
  }

// // follwerUID is the id who will follower of a person
// // follwoingUID is the id who will followed by a person
//   Future<void> addFollower(follwoingUID, follwoingName, follwoingPic) async {
//     followBool.value = true;
//     // update();
//     try {
//       userCollection.doc(follwoingUID).collection('follower').doc().set({
//         'userId': FirebaseAuth.instance.currentUser!.uid,
//         'userProfilePic': FirebaseAuth.instance.currentUser!.photoURL,
//         'userName': FirebaseAuth.instance.currentUser!.displayName,
//       }).then((value) {
//         log('follower added succesfully ');
//         Fluttertoast.showToast(msg: "Following added Successfully");
//       }).catchError((error) {
//         followBool.value = false;
//         // update();
//         log("Failed to add Event: $error");
//       });

//       userCollection
//           .doc(FirebaseAuth.instance.currentUser!.uid)
//           .collection('following')
//           .doc(follwoingUID)
//           .set({
//         'userId': follwoingUID,
//         'userProfilePic': follwoingPic,
//         'userName': follwoingName,
//       }).then((value) {
//         log('follower added succesfully ');
//         followBool.value = false;
//         // update();
//       }).catchError((error) {
//         log("Failed to add Event: $error");
//         followBool.value = false;
//         // update();
//       });
//     } catch (e) {
//       Fluttertoast.showToast(msg: "Error : $e");
//       log('Error = $e');
//       followBool.value = false;
//       // update();
//     }
//   }

//   unFollowUser(unfollowuserId) {
//     try {
//       userCollection
//           .doc(FirebaseAuth.instance.currentUser!.uid)
//           .collection('following')
//           .doc(unfollowuserId)
//           .delete()
//           .then((value) {
//         log('Unfollow succesfull');
//       });
//     } catch (e) {
//       log('error = $e');
//     }
//   }

//   addCategory(String categoryId, String categoryImage, String categoryName,
//       String selected) {
//     try {
//       userCollection
//           .doc(FirebaseAuth.instance.currentUser!.uid)
//           .collection('category')
//           .doc(categoryId)
//           .set({
//         'categoryId': categoryId,
//         'categoryImage': categoryImage,
//         'categoryName': categoryName,
//         'selected': selected
//       }).then((value) {
//         log('follower added succesfully ');
//         followBool.value = false;
//         notificationFun('Category', 'You Added $categoryName Category');
//         update();
//       }).catchError((error) {
//         log("Failed to add Event: $error");
//         followBool.value = false;
//         update();
//       });
//     } catch (e) {
//       Fluttertoast.showToast(msg: "Error : $e");
//       log('Error = $e');
//       followBool.value = false;
//       update();
//     }
//   }

//   addCommentEvent(
//     EventModel singleIndex,
//     String eventId,
//     String commentContent,
//   ) {
//     try {
//       log('user id ==== ${FirebaseAuth.instance.currentUser!.uid}');
//       userCollection
//           .doc(FirebaseAuth.instance.currentUser!.uid)
//           .collection('allComment')
//           .doc(eventId)
//           .set({
//         'eventId': singleIndex.eventUniqueId,
//         'commentContent': commentContent,
//         'commentdateTime': DateTime.now(),
//         'commentPersonImg': singleIndex.profileImage,
//         'commentPersonName': singleIndex.name,
//         'commentLike': 0,
//         'commentReply': 0,
//       }).then((value) {
//         log('listofrealComment = ${singleIndex.listofrealComment!.length.toString()}');
//         singleIndex.listofrealComment != null
//             ? realCommentlistUpdate(
//                 eventId, singleIndex.listofrealComment!, commentContent)
//             : realCommentlistUpdate(eventId, [], commentContent);
//         log('List call ');
//       });
//     } catch (e) {
//       log('Error Saved Event: $e');
//     }
//   }

//   realCommentlistUpdate(
//     String eventId,
//     List commentEventList,
//     String commentContent,
//   ) {
//     // Check if any userId in the list is '12345'
//     var userIdToCheck = FirebaseAuth.instance.currentUser!.uid;
//     bool found = false;
//     for (var user in commentEventList) {
//       if (user['UserId'] == userIdToCheck) {
//         found = true;
//         break;
//       }
//     }

//     if (found) {
//       log('A user with userId $userIdToCheck found in the list.');
//       commentEventList.add(
//         {
//           'UserId': FirebaseAuth.instance.currentUser!.uid,
//           'UserName': FirebaseAuth.instance.currentUser!.displayName,
//           'UserImage': FirebaseAuth.instance.currentUser!.photoURL,
//           'commentSavedDateTime': DateTime.now().toString(),
//           'commentContent': commentContent,
//         },
//       );
//       realCommentlistUpdate2(eventId, commentEventList);
//     } else {
//       log('No user with userId $userIdToCheck found in the list.');
//       List newListcreated = commentEventList.isEmpty ? [] : commentEventList;
//       log('old list length   === ${newListcreated.length}');

//       newListcreated.add(
//         {
//           'UserId': FirebaseAuth.instance.currentUser!.uid,
//           'UserName': FirebaseAuth.instance.currentUser!.displayName,
//           'UserImage': FirebaseAuth.instance.currentUser!.photoURL,
//           'commentSavedDateTime': DateTime.now().toString(),
//           'commentContent': commentContent,
//         },
//       );
//       realCommentlistUpdate2(eventId, newListcreated);
//     }
//   }

//   realCommentlistUpdate2(String eventId, List commentEventList) {
//     try {
//       eventCollection.doc(eventId).update({
//         'listofrealComment': commentEventList,
//       }).then((value) {
//         log('event shear ');
//         // Fluttertoast.showToast(msg: "Event Already Saved !!!!");
//       });
//     } catch (e) {
//       log('Error Saved Event: $e');
//     }
//   }

//   static Future<List<Map<String, dynamic>>> fetchFilteredDocuments() async {
//     // Define your filter criteria
//     String eventType = 'night club';
//     String startDate = '2024-03-31';
//     String economyTicketPrice = '300';

//     try {
//       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//           .collection('events')
//           .where('eventType', isEqualTo: eventType)
//           .where('startDate', isGreaterThan: startDate)
//           .where('economyTicketPrice', arrayContains: economyTicketPrice)
//           .get();

//       // Extract data from documents and store in a list
//       List<Map<String, dynamic>> dataList = [];
//       querySnapshot.docs.forEach((doc) {
//         Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//         dataList.add(data);
//       });

//       return dataList;
//     } catch (e) {
//       // Handle any errors here
//       print("Error fetching documents: $e");
//       return [];
//     }
//   }

//   notificationFun(String notificationtitle, String notificationDescription) {
//     try {
//       var notiId = const Uuid();
//       String notificationId = notiId.v1();
//       userCollection
//           .doc(FirebaseAuth.instance.currentUser!.uid)
//           .collection('notification')
//           .doc(notificationId)
//           .set({
//         'notificationId': notificationId,
//         'notificationDateTime': DateTime.now(),
//         'notificationtitle': notificationtitle,
//         'notificationDescription': notificationDescription,
//       }).then((value) {
//         log('Notification saved succesfully');
//         // Fluttertoast.showToast(msg: "Event Saved !!!!");
//       });
//     } catch (e) {
//       log('Error Saved Event: $e');
//     }
//   }
}
