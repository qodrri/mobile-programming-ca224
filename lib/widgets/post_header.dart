import 'package:flutter/material.dart';

import '../models/moment.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    super.key,
    required this.momentItem,
    required this.onUpdate,
    required this.onDelete,
  });
  final Moment momentItem;
  final Function(Moment) onUpdate;
  final Function(Moment) onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
      ),
      title: Text(
        momentItem.creator,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white70,
        ),
      ),
      subtitle: Text(
        momentItem.location,
        style: const TextStyle(
          color: Colors.white60,
        ),
      ),
      trailing: PopupMenuButton(
        itemBuilder: (context) {
          return [
            const PopupMenuItem(
              value: 'Update',
              child: Text('Update'),
            ),
            const PopupMenuItem(
              value: 'Delete',
              child: Text('Delete'),
            ),
          ];
        },
        onSelected: (value) {
          if (value == 'Update') {
            onUpdate(momentItem);
          } else if (value == 'Delete') {
            onDelete(momentItem);
          }
        },
        child: const Icon(
          Icons.more_vert_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
