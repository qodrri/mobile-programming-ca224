import 'package:flutter/material.dart';

import '../../../core/resources/colors.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/loading';
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(),
            Image.asset(
              'assets/images/moments_logo.png',
              alignment: Alignment.center,
              fit: BoxFit.fitWidth,
              width: 300,
            ),
            const Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Loading Data...',
                  style: TextStyle(color: primaryColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
