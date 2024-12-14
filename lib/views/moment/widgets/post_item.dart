import 'package:flutter/material.dart';
import 'package:myapp/models/moment.dart';
import 'package:myapp/core/resources/dimensions.dart';
import 'package:myapp/views/moment/widgets/post_action_list.dart';
import 'package:myapp/views/moment/widgets/post_header.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    super.key,
    required this.moment,
  });

  final Moment moment;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Container(
        margin: const EdgeInsets.fromLTRB(
          largeSize,
          0,
          largeSize,
          largeSize,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(xLargeSize),
          image: DecorationImage(
            image: NetworkImage(moment.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PostHeader(momentItem: moment),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PostActionList(momentItem: moment),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    largeSize,
                    0,
                    largeSize,
                    mediumSize,
                  ),
                  child: Text(
                    moment.caption,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
