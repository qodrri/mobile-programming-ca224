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
    "Agus",
    "Aldy",
    "Sista",
    "Eka",
    "Mahesa",
    "Ilham",
  ];

  List msgTiming = [
    "Yesterday",
    "13:40",
    "28/10/24",
    "07:20",
    "Yesterday",
  ];

  List msgs = [
    "Halo, Apa Kabs?",
    "Kamu dimana?",
    "Halo bang, kabar baik?",
    "Keren",
    "Gasken Nongki",
    "Bye-bye",
  ];

  List msgRead = [
    true,
    true,
    false,
    false,
    true,
    true,
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
              
            ),
          ],
        ),
      ),
    );
  }
}
