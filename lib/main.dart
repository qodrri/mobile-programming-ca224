import 'package:flutter/material.dart';
import 'screens/hewan_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Data Hewan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HewanListScreen(),
    );
  }
}
