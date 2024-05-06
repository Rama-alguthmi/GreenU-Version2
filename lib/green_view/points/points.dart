import 'package:chiblane/green_auth/signup_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Points extends StatelessWidget {
  Points({super.key});
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: firestore
            .collection('userGreen')
            .orderBy('userScore', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var users = snapshot.data!.docs;

          return Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  rankCircular(
                      num: "1",
                      name: "${users[0]['userName']}",
                      img: "${users[0]['img']}"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  rankCircular(
                      num: "2",
                      name: "${users[1]['userName']}",
                      img: "${users[1]['img']}"),
                  rankCircular(
                      num: "3",
                      name: "${users[2]['userName']}",
                      img: "${users[2]['img']}"),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xff18181b),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xff1FCF6A),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          children: [
                            Expanded(
                                child: Text(
                              "Rank",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                              ),
                            )),
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    "Player",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Points",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          var user = users[index];

                          var name = (user['userName'][0] ?? "").toUpperCase();

                          return Container(
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              color: Color(0xff27272A),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "#${index + 1}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                                Expanded(
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 15,
                                        // child: Text(
                                        //   "${name}",
                                        //   style: TextStyle(
                                        //     color: Colors.white,
                                        //     fontWeight: FontWeight.w600,
                                        //   ),
                                        // ),
                                        backgroundImage:
                                            NetworkImage(user['img']),
                                        backgroundColor: Color(
                                            0xff1FCF6A), // Customize the color as needed
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "${user['userName']}",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "${user['userScore']}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget rankCircular(
      {required String num, required String name, required String img}) {
    var namLetter = (name[0] ?? "").toUpperCase();
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 50,
              child: CircleAvatar(
                radius: 45,
                // child: Text(
                //   namLetter,
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
                backgroundImage: NetworkImage(img),
                backgroundColor: Colors.black,
              ),
              backgroundColor: num != "1"
                  ? Color(0xff333335)
                  : Color(0xffA3E635), // Customize the color as needed
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: -10,
              child: Center(
                child: CircleAvatar(
                  radius: 15,
                  child: Text(
                    num,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  backgroundColor:
                      num != "1" ? Color(0xff333335) : Color(0xffA3E635),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
