import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  String? photos;
  String? eventName;
  String? eventType;
  String? eventMode;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? country;
  String? description;
  String? vipTicketPrice;
  String? economyTicketPrice;
  String? ticketPurchaseDeadline;
  String? ticketPaymentCountry;
  String? chosePaymentMethod;
  List? listofLikes;
  List? listofComments;
  List? listofShear;
  List? listofrealComment;
  String? userid;
  String? name;
  String? dob;
  String? profileImage;
  String? eventcreateddate;
  String? eventUniqueId;
  List? totalTicketBuyers;

  EventModel({
    this.photos,
    this.eventName,
    this.eventType,
    this.eventMode,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.country,
    this.description,
    this.vipTicketPrice,
    this.economyTicketPrice,
    this.ticketPurchaseDeadline,
    this.chosePaymentMethod,
    this.listofLikes,
    this.listofComments,
    this.listofShear,
    this.listofrealComment,
    this.userid,
    this.name,
    this.dob,
    this.profileImage,
    this.ticketPaymentCountry,
    this.eventcreateddate,
    this.eventUniqueId,
    this.totalTicketBuyers,
  });

  Map<String, dynamic> toJson() {
    return {
      'photos': photos,
      'eventName': eventName,
      'eventType': eventType,
      "eventMode": eventMode,
      "startDate": startDate,
      "endDate": endDate,
      "startTime": startTime,
      "endTime": endTime,
      "address1": address1,
      'address2': address2,
      'city': city,
      'state': state,
      'country': country,
      'description': description,
      'vipTicketPrice': vipTicketPrice,
      'economyTicketPrice': economyTicketPrice,
      'ticketPurchaseDeadline': ticketPurchaseDeadline,
      'chosePaymentMethod': chosePaymentMethod,
      'listofLikes': listofLikes,
      'listofComments': listofComments,
      'listofShear': listofShear,
      'listofrealComment': listofrealComment,
      'userid': userid,
      'name': name,
      'dob': dob,
      'profileImage': profileImage,
      'ticketPaymentCountry': ticketPaymentCountry,
      'eventcreateddate': eventcreateddate,
      'eventUniqueId': eventUniqueId,
      'totalTicketBuyers': totalTicketBuyers,
    };
  }

  static EventModel fromJson(DocumentSnapshot json) {
    Map<String, dynamic> data = json.data() as Map<String, dynamic>;
    return EventModel(
      photos: data['photos'].toString(),
      eventName: data['eventName'].toString(),
      eventType: data['eventType'].toString(),
      eventMode: data['eventMode'].toString(),
      startDate: data['startDate'].toString(),
      endDate: data['endDate'].toString(),
      startTime: data['startTime'].toString(),
      endTime: data['endTime'].toString(),
      address1: data['address1'].toString(),
      address2: data['address2'].toString(),
      city: data['city'].toString(),
      state: data['state'].toString(),
      country: data['country'].toString(),
      description: data['description'].toString(),
      vipTicketPrice: data['vipTicketPrice'].toString(),
      economyTicketPrice: data['economyTicketPrice'].toString(),
      ticketPurchaseDeadline: data['ticketPurchaseDeadline'].toString(),
      chosePaymentMethod: data['chosePaymentMethod'].toString(),
      listofLikes: data['listofLikes'],
      listofComments: data['listofComments'],
      listofShear: data['listofShear'],
      listofrealComment: data['listofrealComment'] ?? [],
      userid: data['userid'].toString(),
      name: data['name'].toString(),
      dob: data['dob'].toString(),
      profileImage: data['profileImage'].toString(),
      ticketPaymentCountry: data['ticketPaymentCountry'],
      eventcreateddate: data['eventcreateddate'],
      eventUniqueId: data['eventUniqueId'],
      totalTicketBuyers: data['totalTicketBuyers'],
    );
  }
}

class ListofShears {
  String userId;
  String userName;
  String userImage;
  String lengthofList;

  ListofShears({
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.lengthofList,
  });

  factory ListofShears.fromMap(Map<String, dynamic> json) => ListofShears(
        userId: json["userId"],
        userName: json["userName"],
        userImage: json["userImage"],
        lengthofList: json["lengthofList"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "userName": userName,
        "userImage": userImage,
        "lengthofList": lengthofList,
      };
}

class ListofComments {
  String userId;
  String userName;
  String userImage;
  String lengthofList;

  ListofComments({
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.lengthofList,
  });

  factory ListofComments.fromMap(Map<String, dynamic> json) => ListofComments(
        userId: json["userId"],
        userName: json["userName"],
        userImage: json["userImage"],
        lengthofList: json["lengthofList"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "userName": userName,
        "userImage": userImage,
        "lengthofList": lengthofList,
      };
}

class ListofLike {
  String userId;
  String userName;
  String userImage;
  String lengthofList;

  ListofLike({
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.lengthofList,
  });

  factory ListofLike.fromMap(Map<String, dynamic> json) => ListofLike(
        userId: json["userId"],
        userName: json["userName"],
        userImage: json["userImage"],
        lengthofList: json["lengthofList"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "userName": userName,
        "userImage": userImage,
        "lengthofList": lengthofList,
      };
}
