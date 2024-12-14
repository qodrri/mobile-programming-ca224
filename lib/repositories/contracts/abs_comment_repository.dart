import '../../models/comment.dart';

abstract class AbsCommentRepository {
  Future<void> addComment(Comment newComment);
  Future<void> updateComment(Comment updateComment);
  Future<void> deleteComment(String commentId);
  Future<Comment?> getCommentById(String commentId);
  Future<List<Comment>> getAllComments(String momentId);
}
