import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/resources/dimensions.dart';
import '../../authentication/bloc/authentication_bloc.dart';

class UserSettingPage extends StatelessWidget {
  static const String routeName = '/user/setting';
  const UserSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('User Setting'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: largeSize,
        ),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.logout_rounded),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                context
                    .read<AuthenticationBloc>()
                    .add(AuthenticationLoggedOutEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
