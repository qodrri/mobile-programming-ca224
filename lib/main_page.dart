import 'package:flutter/material.dart';
import 'package:myapp/home_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    // Screen 1
    HomeScreen(),
    // Screen 2
    Container(),
    // Screen 3
    Container(),
    // Screen 4
    Container(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildNavBarItem(
      IconData filledIcon, IconData outlinedicon, String text, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              decoration: BoxDecoration(
                color:
                    _selectedIndex == index ? Color(0xFFD8FDD2) : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                _selectedIndex == index ? filledIcon : outlinedicon,
                size: 28,
                color:
                    _selectedIndex == index ? Color(0xFF125E3A) : Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight:
                    _selectedIndex == index ? FontWeight.w900 : FontWeight.w500,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(color: Colors.black12, width: 0.4),
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavBarItem(Icons.message, Icons.message_outlined, "Chats", 0),
            buildNavBarItem(Icons.update, Icons.update_outlined, "Updates", 1),
            buildNavBarItem(Icons.people, Icons.people, "Communications", 2),
            buildNavBarItem(Icons.call, Icons.call_outlined, "Calls", 3),
          ],
        ),
      ),
    );
  }
}
