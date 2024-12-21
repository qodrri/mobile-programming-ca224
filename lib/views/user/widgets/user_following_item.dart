import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/resources/colors.dart';
import 'package:myapp/models/user.dart';

import '../../common/widgets/small_circular_progress_indicator.dart';
import '../bloc/user_data_bloc.dart';

class UserFollowingItem extends StatelessWidget {
  const UserFollowingItem({
    super.key,
    required this.user,
  });
  final User user;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataBloc, UserDataState>(
      builder: (context, state) {
        bool isLoading = false;
        if (state is UserDataFollowLoadingState) {
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
              context.read<UserDataBloc>().add(UserDataFollowEvent(user.id));
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                primaryColor,
              ),
            ),
            child: isLoading
                ? const SmallCircularProgressIndicator()
                : const Text(
                    'Unfollow',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
