import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Import this package for date formatting

class GroupChat extends StatefulWidget {
  final String collectionId;

  GroupChat({required this.collectionId});
  @override
  State<GroupChat> createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final TextEditingController commentController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  final String currentUserId = FirebaseAuth.instance.currentUser!.uid;
  // Placeholder for current user ID

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.collectionId.toString()),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: firestore
                  .collection('greenCommunity')
                  .doc("${widget.collectionId}")
                  .collection('${widget.collectionId}')
                  .orderBy('timestamp', descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                var comments = snapshot.data!.docs;
                WidgetsBinding.instance?.addPostFrameCallback((_) {
                  _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                });

                return ListView.builder(
                  controller: _scrollController,
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    var comment = comments[index];
                    bool isCurrentUserComment =
                        comment['userId'] == currentUserId;

                    // Format timestamp
                    var timestamp =
                        (comment['timestamp'] as Timestamp).toDate();
                    var formattedTime = DateFormat.jm().format(timestamp);
                    var name = (comment['username'][0] ?? "").toUpperCase();

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: !isCurrentUserComment
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                        children: [
                          if (!isCurrentUserComment)
                            CircleAvatar(
                              // Display your profile image
                              radius: 20,
                              // child: Text(
                              //   "${name}",
                              //   style: TextStyle(
                              //     fontWeight: FontWeight.bold,
                              //     fontSize: 18,
                              //     color: Colors.white,
                              //   ),
                              // ),
                              backgroundImage: NetworkImage(
                                comment['img'],
                              ),
                              backgroundColor: Color(
                                  0xff1FCF6A), // Customize the color as needed
                            ),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isCurrentUserComment
                                  ? Color(0xff353841)
                                  : Color(0xff353841),
                              borderRadius: BorderRadius.only(
                                topLeft: isCurrentUserComment
                                    ? Radius.circular(16)
                                    : Radius.circular(0),
                                topRight: isCurrentUserComment
                                    ? Radius.circular(0)
                                    : Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // if (!isCurrentUserComment)
                                //   Text(
                                //     comment['username'],
                                //     style: TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       color: Colors.white,
                                //     ),
                                //   ),
                                // SizedBox(height: 4),
                                Text(
                                  comment['commentText'],
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  formattedTime,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8),
                          if (isCurrentUserComment)
                            CircleAvatar(
                              // Display your profile image
                              radius: 20,
                              // child: Text(
                              //   "${name}",
                              //   style: TextStyle(
                              //     fontWeight: FontWeight.bold,
                              //     fontSize: 18,
                              //     color: Colors.white,
                              //   ),
                              // ),
                              backgroundImage: NetworkImage(
                                comment['img'],
                              ),
                              backgroundColor: Color(
                                  0xff1FCF6A), // Customize the color as needed
                            ),
                          SizedBox(width: 8),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: commentController,
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Color(0xff1FCF6A),
                  ),
                  onPressed: () {
                    addComment(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void addComment(BuildContext context) {
    // Get current user details from authentication
    // For simplicity, let's assume you already have the user details

    String username = FirebaseAuth.instance.currentUser!.email ?? "";
    String userImg = FirebaseAuth.instance.currentUser!.photoURL ?? "";

    String commentText = commentController.text.trim();
    print('commentText: ${commentText}');

    if (commentText.isNotEmpty) {
      firestore
          .collection('greenCommunity')
          .doc("${widget.collectionId}")
          .collection("${widget.collectionId}")
          .add({
        'userId': currentUserId,
        'username': username,
        'img': userImg,
        'commentText': commentText,
        'timestamp': Timestamp.now(),
      }).then((value) {
        // Clear the text field after adding comment
        commentController.clear();
      }).catchError((error) {
        // Handle errors
        print('Failed to add comment: $error');
      });
    }
  }
}
