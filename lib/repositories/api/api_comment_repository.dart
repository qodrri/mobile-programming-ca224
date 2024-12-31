// lib/repositories/api/api_comment_repository.dart

import 'package:dio/dio.dart';
import 'package:myapp/repositories/contracts/abs_api_comment_repository.dart';
import '../../models/comment.dart';
import 'api_comment_repository.dart';

class ApiCommentRepositoryImpl implements AbsApiCommentRepository {
  final Dio dio;

  ApiCommentRepositoryImpl(this.dio);

  @override
  Future<List<Comment>> getAll(String momentId, [String keyword = '']) async {
    try {
      final response = await dio.get('/comments', queryParameters: {
        'momentId': momentId,
        'keyword': keyword,
      });
      List<Comment> comments = (response.data as List)
          .map((json) => Comment.fromJson(json))  // Pastikan menggunakan Comment.fromJson
          .toList();
      return comments;
    } catch (e) {
      throw Exception('Failed to load comments: $e');
    }
  }

  @override
  Future<List<Comment>> getWithPagination(
    String momentId, [
    int page = 1,
    int size = 10,
    String keyword = '',
  ]) async {
    try {
      final response = await dio.get('/comments', queryParameters: {
        'momentId': momentId,
        'page': page,
        'size': size,
        'keyword': keyword,
      });
      List<Comment> comments = (response.data as List)
          .map((json) => Comment.fromJson(json))  // Pastikan menggunakan Comment.fromJson
          .toList();
      return comments;
    } catch (e) {
      throw Exception('Failed to fetch comments with pagination: $e');
    }
  }

  @override
  Future<Comment?> getById(String momentId, String id) async {
    try {
      final response = await dio.get('/comments/$id', queryParameters: {
        'momentId': momentId,
      });
      return Comment.fromJson(response.data);  // Pastikan menggunakan Comment.fromJson
    } catch (e) {
      throw Exception('Failed to fetch comment by id: $e');
    }
  }

  @override
  Future<Comment?> create(String momentId, Comment newData) async {
    try {
      final response = await dio.post('/comments', data: {
        'momentId': momentId,
        'content': newData.content,  // Gunakan 'content' di sini, bukan 'text'
        'creatorId': newData.creatorId,
      });
      return Comment.fromJson(response.data);  // Pastikan menggunakan Comment.fromJson
    } catch (e) {
      throw Exception('Failed to create comment: $e');
    }
  }

  @override
  Future<bool> update(String momentId, Comment updatedData) async {
    try {
      final response = await dio.put('/comments/${updatedData.id}', data: {
        'momentId': momentId,
        'content': updatedData.content,  // Gunakan 'content' di sini, bukan 'text'
        'creatorId': updatedData.creatorId,
      });
      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Failed to update comment: $e');
    }
  }

  @override
  Future<bool> delete(String momentId, String id) async {
    try {
      final response = await dio.delete('/comments/$id', queryParameters: {
        'momentId': momentId,
      });
      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Failed to delete comment: $e');
    }
  }
}
