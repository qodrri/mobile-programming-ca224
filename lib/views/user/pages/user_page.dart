import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/resources/dimensions.dart';

import '../../authentication/bloc/authentication_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final activeUser = context.watch<AuthenticationBloc>().activeUser;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: largeSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      activeUser?.imageUrl ?? 'https://i.pravatar.cc/150'),
                ),
                title: Text(activeUser != null
                    ? '${activeUser.firstName} ${activeUser.lastName}'.trim()
                    : 'User Full Name'),
                subtitle: Text(activeUser?.username ?? 'Username'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout_rounded),
              title: const Text('Logout'),
              onTap: () => context
                  .read<AuthenticationBloc>()
                  .add(AuthenticationLoggedOutEvent()),
            )
          ],
        ),
      ),
    );
  }
}
