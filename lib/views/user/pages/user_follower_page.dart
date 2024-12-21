import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/views/user/bloc/user_data_bloc.dart';
import 'package:myapp/views/user/widgets/user_follower_item.dart';

class UserFollowerPage extends StatefulWidget {
  static const String routeName = '/user/follower';
  const UserFollowerPage({super.key});

  @override
  State<UserFollowerPage> createState() => _UserFollowerPageState();
}

class _UserFollowerPageState extends State<UserFollowerPage> {
  @override
  void initState() {
    context.read<UserDataBloc>().add(UserDataGetFollowerEvent());
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
        title: const Text('Follower'),
      ),
      body: BlocBuilder<UserDataBloc, UserDataState>(
        builder: (context, state) {
          List<User> users = [];
          if (state is UserDataGetFollowerSuccessState) {
            users = state.followers;
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final user = users[index];
              return UserFollowerItem(
                user: user,
                isFollowing: index.isEven,
              );
            },
            itemCount: users.length,
          );
        },
      ),
    );
  }
}
