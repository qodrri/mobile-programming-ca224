import 'package:flutter/material.dart';

import '../../../models/moment.dart';
import '../../comment/pages/comment_page.dart';
import 'post_action.dart';

class PostActionList extends StatelessWidget {
  const PostActionList({
    super.key,
    required this.momentItem,
  });
  final Moment momentItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PostAction(
          asset: 'assets/icons/fi-br-heart.svg',
          label: momentItem.likesCount.toString(),
          onTap: () {
            
          },
        ),
        PostAction(
          asset: 'assets/icons/fi-br-comment.svg',
          label: momentItem.commentsCount.toString(),
          onTap: () {
            Navigator.pushNamed(
              context,
              CommentPage.routeName,
              arguments: momentItem.id,
            );
          },
        ),
        PostAction(
          asset: 'assets/icons/fi-br-bookmark.svg',
          label: momentItem.bookmarksCount.toString(),
          onTap: () {
            
          },
        ),
      ],
    );
  }
}
