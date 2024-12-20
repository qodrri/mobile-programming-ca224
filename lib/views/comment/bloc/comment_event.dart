import 'package:myapp/models/comment.dart';

abstract class CommentEvent {}

class LoadComments extends CommentEvent {
  final String momentId;

  LoadComments(this.momentId);
}

class AddComment extends CommentEvent {
  final String momentId;
  final Comment comment; // Pastikan ini bertipe Comment

  AddComment(this.momentId, this.comment);
}
