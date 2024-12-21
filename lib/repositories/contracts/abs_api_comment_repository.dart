import '../../models/comment.dart';

abstract class AbsApiCommentRepository {
  Future<List<Comment>> getAll(String momentId, [String keyword = '']);
  Future<List<Comment>> getWithPagination(String momentId,
      [int page = 1, int size = 10, String keyword = '']);
  Future<Comment?> getById(String momentId, String id);
  Future<Comment?> create(String momentId, Comment newData);
  Future<bool> update(String momentId, Comment updatedData);
  Future<bool> delete(String momentId, String id);
}
