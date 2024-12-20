import 'package:myapp/models/comment.dart';

abstract class CommentRepository {
  Future<List<Comment>> fetchComments(String momentId);
  Future<void> addComment(String momentId, Comment comment); // Tambahkan ini
}

class CommentRepositoryImpl implements CommentRepository {
  @override
  Future<List<Comment>> fetchComments(String momentId) async {
    // Simulasi data komentar
    return List.generate(
      5,
      (index) => Comment(
        id: 'id_$index',
        creator: 'User $index',
        content: 'This is comment $index for moment $momentId',
        createdAt: DateTime.now().subtract(Duration(days: index)),
        momentId: momentId,
      ),
    );
  }

  @override
  Future<void> addComment(String momentId, Comment comment) async {
    // Logika penyimpanan komentar (simulasi)
    print('Comment added: ${comment.content} for moment $momentId');
    return;
  }
}
