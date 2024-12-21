import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/resources/colors.dart';
import 'package:myapp/models/user.dart';

import '../../common/widgets/small_circular_progress_indicator.dart';
import '../bloc/user_data_bloc.dart';

class UserFollowerItem extends StatelessWidget {
  const UserFollowerItem({
    super.key,
    required this.user,
    this.isFollowing = false,
  });
  final User user;
  final bool isFollowing;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataBloc, UserDataState>(
      builder: (context, state) {
        bool isLoading = false;
        if (!isFollowing && state is UserDataFollowLoadingState) {
          if (state.userId == user.id) {
            isLoading = true;
          }
        } else if (isFollowing && state is UserDataUnfollowLoadingState) {
          if (state.userId == user.id) {
            isLoading = true;
          }
        }
        return ListTile(
          leading: CircleAvatar(
            backgroundImage:
                NetworkImage(user.imageUrl ?? 'https://i.pravatar.cc/150'),
          ),
          title: Text(
            user.username.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            '${user.firstName} ${user.lastName}'.trim(),
          ),
          trailing: ElevatedButton(
            onPressed: () {
              if (isFollowing) {
                context
                    .read<UserDataBloc>()
                    .add(UserDataUnfollowEvent(user.id));
              } else {
                context.read<UserDataBloc>().add(UserDataFollowEvent(user.id));
              }
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                isFollowing ? Colors.white : primaryColor,
              ),
            ),
            child: isLoading
                ? const SmallCircularProgressIndicator()
                : Text(
                    isFollowing ? 'Unfollow' : 'Follow',
                    style: TextStyle(
                      color: isFollowing ? Colors.black : Colors.white,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
