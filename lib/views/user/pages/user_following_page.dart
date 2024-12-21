import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/views/user/bloc/user_data_bloc.dart';

import '../widgets/user_following_item.dart';

class UserFollowingPage extends StatefulWidget {
  static const String routeName = '/user/following';
  const UserFollowingPage({super.key});

  @override
  State<UserFollowingPage> createState() => _UserFollowingPageState();
}

class _UserFollowingPageState extends State<UserFollowingPage> {
  @override
  void initState() {
    context.read<UserDataBloc>().add(UserDataGetFollowingEvent());
    super.initState();
  }

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
        title: const Text('Following'),
      ),
      body: BlocBuilder<UserDataBloc, UserDataState>(
        builder: (context, state) {
          List<User> users = [];
          if (state is UserDataGetFollowingSuccessState) {
            users = state.followings;
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final user = users[index];
              return UserFollowingItem(
                user: user,
              );
            },
            itemCount: users.length,
          );
        },
      ),
    );
  }
}
