import 'package:flutter/material.dart';
import 'package:myapp/core/resources/colors.dart';
import 'package:myapp/models/user.dart';

class UserFollowItem extends StatelessWidget {
  const UserFollowItem({
    super.key,
    required this.user,
    this.isFollowing = false,
  });
  final User user;
  final bool isFollowing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage:
            NetworkImage(user.imageUrl ?? 'https://i.pravatar.cc/150'),
      ),
      title: Text(
        user.username.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white70,
        ),
      ),
      subtitle: Text(
        '${user.firstName} ${user.lastName}'.trim(),
        style: const TextStyle(
          color: Colors.white60,
        ),
      ),
      trailing: ElevatedButton(
        onPressed: () {
          if (isFollowing) {
            // Unfollow user
          } else {
            // Follow user
          }
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            isFollowing ? Colors.white : primaryColor,
          ),
        ),
        child: Text(
          isFollowing ? 'Unfollow' : 'Follow',
          style: TextStyle(
            color: isFollowing ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
