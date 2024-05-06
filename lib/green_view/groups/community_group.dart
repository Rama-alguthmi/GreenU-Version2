import 'dart:developer';

import 'package:chiblane/green_view/groups/group_chat.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CommunityGroup extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            tile("Green Saudi community"),
            tile("EarthSavers"),
            tile("Sustainable Action Network"),
            tile("Green Riyadh"),
            tile("Green Jeddah"),
            tile("Abha’s nature voice"),
            tile("Small steps Big Impact"),
          ],
        ),
      ),

      // StreamBuilder<QuerySnapshot>(
      //   stream: firestore.collection('greenCommunity').snapshots(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: CircularProgressIndicator());
      //     }

      //     if (snapshot.hasError) {
      //       return Center(child: Text('Error: ${snapshot.error}'));
      //     }

      //     final documents = snapshot.data!.docs;
      //     log('documents: ${documents}');

      //     return ListView.builder(
      //       itemCount: documents.length,
      //       itemBuilder: (context, index) {
      //         final doc = documents[index];

      //         return ListTile(
      //           title: Text(doc.id),
      //           onTap: () {
      //             navigateToSubcollectionPage(context, doc.id);
      //           },
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }

  Widget tile(name) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          // Display your profile image
          radius: 25,
          backgroundImage: AssetImage("assets/app_images/cat1.png"),
          backgroundColor: Colors.blue, // Customize the color as needed
        ),
        title: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
        onTap: () {
          Get.to(GroupChat(collectionId: name));
        },
      ),
    );
  }
}
