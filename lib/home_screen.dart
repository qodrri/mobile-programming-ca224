import 'dart:ffi';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  List images = [
    "images/profile1.jpg",
    "images/profile2.jpg",
    "images/profile3.jpg",
    "images/profile4.jpg",
    "images/profile5.jpg",
    "images/profile6.jpg",
  ];

  List names = [
    "Kuris",
    "Aldy",
    "Sista",
    "Eka",
    "Mahesa",
    "Ilham",
  ];

  List msgTiming = [
    "22:19",
    "20:55",
    "19:47",
    "15:23",
    "Yesterday",
    "Yesterday",
  ];

  List msgs = [
    "Apa kabar qod?",
    "Udah lese laporannya?",
    "Aku telat dikit ya ban motorku kempes",
    "Mabar qod",
    "Hari apa khe kuliah?",
    "Lagi santai kawan",
  ];

  List msgRead = [
    true,
    true,
    false,
    false,
    true,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Custom App bar
            Padding(
              padding: EdgeInsets.only(top: 40, left: 15, bottom: 15),
              child: Row(
                children: [
                  Text(
                    "WhatsApp",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1DA75E),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(Icons.camera_alt_outlined, size: 28),
                  ),
                  PopupMenuButton(
                    onSelected: (selected) {
                      if (selected == 5) {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => SettingsScreen(),
                        //     ));
                      }
                    },
                    elevation: 10,
                    iconSize: 28,
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: Text(
                          "New group",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text(
                          "New broadcast",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: 3,
                        child: Text(
                          "Linked devices",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: 4,
                        child: Text(
                          "Starred messages",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: 5,
                        child: Text(
                          "Settings",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Search container
            Container(
              margin: EdgeInsets.only(bottom: 15, left: 10, right: 10),
              decoration: BoxDecoration(
                color: Color(0xFFF6F5F3),
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search...",
                  border: InputBorder.none,
                ),
              ),
            ),
            // Archived
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.archive_outlined,
                    size: 30,
                  ),
                  SizedBox(width: 25),
                  Text(
                    "Archived",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "12",
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF1DA75E),
                    ),
                  ),
                ],
              ),
            ),
            // Chats
            ListView.builder(
              itemCount: images.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => ChatScreen(),
                          //     ));
                        },
                        leading: CircleAvatar(
                          maxRadius: 28,
                          backgroundImage: AssetImage(
                            images[index],
                          ),
                        ),
                        title: Text(
                          names[index],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                        subtitle: Text(
                          msgs[index],
                          style: TextStyle(
                            color: Color(0xFF636f75),
                          ),
                        ),
                        trailing: msgRead[index]
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    msgTiming[index],
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF1DA75E),
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF1DA75E),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      "5",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Text(
                                msgTiming[index],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              )));
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF1DA75E),
        child: Center(
          child: Image.asset("images/send.jpg"),
        ),
      ),
    );
  }
}
