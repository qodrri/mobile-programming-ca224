import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:myapp/core/resources/constants.dart';

import 'shared_preference_manager.dart';

class DioInterceptor extends Interceptor {
  final Dio dio;

  DioInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final spm = await SharedPreferencesManager.getInstance();
    if (spm != null &&
        spm.isKeyExists(SharedPreferencesManager.keyAccessToken)) {
      final accessToken =
          spm.getString(SharedPreferencesManager.keyAccessToken);
      // Add your request headers here
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 errors
    if (err.response?.statusCode == 401) {
      // Get the refresh token from shared preferences
      final spm = await SharedPreferencesManager.getInstance();
      if (spm != null &&
          spm.isKeyExists(SharedPreferencesManager.keyRefreshToken)) {
        final refreshToken =
            spm.getString(SharedPreferencesManager.keyRefreshToken);
        if (refreshToken != null) {
          final newAccessToken = await _refreshToken(refreshToken);
          if (newAccessToken != null) {
            // Update the request headers with the new access token
            final options = err.requestOptions;
            options.headers['Authorization'] = 'Bearer $newAccessToken';
            return handler.resolve(await dio.fetch(options));
          }
        }
      }
    }
    super.onError(err, handler);
  }

  Future<String?> _refreshToken(String refreshToken) async {
    // Add your refresh token logic here
    try {
      const baseUri = '$baseUrl/api/auth/refresh-token';
      final options = BaseOptions(
        baseUrl: baseUri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      final dio = Dio(options);
      final response = await dio.post('', data: {'refreshToken': refreshToken});
      if (response.statusCode == 200) {
        // Store the new access token and refresh token
        final spm = await SharedPreferencesManager.getInstance();
        if (spm != null) {
          await spm.putString(SharedPreferencesManager.keyAccessToken,
              response.data['accessToken']);
          await spm.putString(SharedPreferencesManager.keyRefreshToken,
              response.data['refreshToken']);
        }
        return response.data['accessToken'];
      }
    } catch (e) {
      log(e.toString(), name: 'DioInterceptor:_refreshToken');
    }
    return null;
  }
}
