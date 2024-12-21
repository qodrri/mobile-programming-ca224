import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:myapp/core/resources/constants.dart';
import 'package:myapp/models/moment.dart';

import 'package:myapp/models/user.dart';

import '../../core/helpers/dio_interceptor.dart';
import '../contracts/abs_api_user_data_repository.dart';

class ApiUserDataRepository extends AbsApiUserDataRepository {
  late final String _baseUri;
  late final Dio _dio;
  late final BaseOptions _options;

  ApiUserDataRepository(String? userId) {
    _baseUri = '$baseUrl/api/users/$userId';
    _options = BaseOptions(
      baseUrl: _baseUri,
    );
    _dio = Dio(_options);
    _dio.interceptors.add(DioInterceptor(_dio));
  }

  @override
  Future<bool> follow(String userId) async {
    try {
      final response = await _dio.post('/following/$userId');
      if (response.statusCode == 204) {
        return true;
      }
    } catch (e) {
      log(e.toString(), name: 'ApiUserDataRepository.follow');
    }
    return false;    
  }

  @override
  Future<List<User>> getFollowers([String keyword = '']) async {
    try {
      final response = await _dio.get('/followers/all');
      if (response.statusCode == 200) {
        return (response.data as List).map((e) => User.fromMap(e)).toList();
      }
    } catch (e) {
      log(e.toString(), name: 'ApiUserDataRepository.getFollowers');
    }
    return [];
  }

  @override
  Future<List<User>> getFollowing([String keyword = '']) async {
    try {
      final response = await _dio.get('/followings/all');
      if (response.statusCode == 200) {
        return (response.data as List).map((e) => User.fromMap(e)).toList();
      }
    } catch (e) {
      log(e.toString(), name: 'ApiUserDataRepository.getFollowing');
    }
    return [];
  }

  @override
  Future<List<Moment>> getMoments([String keyword = '']) async {
    try {
      final response = await _dio.get('/moments');
      if (response.statusCode == 200) {
        return (response.data as List).map((e) => Moment.fromMap(e)).toList();
      }
    } catch (e) {
      log(e.toString(), name: 'ApiUserDataRepository.getMoments');
    }
    return [];
  }

  @override
  Future<bool> unfollow(String userId) async {
    
    try {
      final response = await _dio.delete('/following/$userId');
      if (response.statusCode == 204) {
        return true;
      }
    } catch (e) {
      log(e.toString(), name: 'ApiUserDataRepository.unfollow');
    }
    return false;  
  }
}
