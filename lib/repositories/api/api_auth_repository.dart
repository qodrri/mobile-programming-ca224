import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:myapp/core/helpers/shared_preference_manager.dart';
import 'package:myapp/core/resources/constants.dart';
import 'package:myapp/models/user.dart';

import '../contracts/abs_auth_repository.dart';

class ApiAuthRepository extends AbsAuthRepository {
  final _baseUrl = "$baseUrl/api/auth";
  late final Dio _dio;
  late BaseOptions _options;

  ApiAuthRepository() {
    _options = BaseOptions(
      baseUrl: _baseUrl,
    );
    _dio = Dio(_options);
  }

  @override
  Future<(bool, String)> forgotPassword(String username) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<User?> info() async {
    try {
      final spm = await SharedPreferencesManager.getInstance();
      if (spm != null) {
        if (spm.isKeyExists(SharedPreferencesManager.keyActiveUser)) {
          return User.fromJson(
              spm.getString(SharedPreferencesManager.keyActiveUser)!);
        }
      }
    } catch (e) {
      log(e.toString(), name: "ApiAuthRepository:info");
    }
    return null;
  }

  @override
  Future<bool> isAuthenticated() async {
    try {
      final spm = await SharedPreferencesManager.getInstance();
      if (spm != null) {
        if (spm.isKeyExists(SharedPreferencesManager.keyAccessToken)) {
          final accessToken =
              spm.getString(SharedPreferencesManager.keyAccessToken)!;
          final expiryDate = _getExpiryDate(accessToken);
          if (expiryDate != null && expiryDate.isAfter(DateTime.now())) {
            return true;
          }
        }
      }
    } catch (e) {
      log(e.toString(), name: "ApiAuthRepository:isAuthenticated");
    }
    return false;
  }

  @override
  Future<(bool, String)> login(UserLoginDto dataLogin) async {
    try {
      final response = await _dio.post("/login", data: dataLogin.toMap());
      if (response.statusCode == 200) {
        // Penyimpanan token dan user data di SharedPreferences
        final spm = await SharedPreferencesManager.getInstance();
        if (spm != null) {
          await spm.putString(SharedPreferencesManager.keyAccessToken,
              response.data["accessToken"]);
          await spm.putString(SharedPreferencesManager.keyRefreshToken,
              response.data["refreshToken"]);
          final userData = User.fromMap(response.data["userData"]);
          await spm.putString(
              SharedPreferencesManager.keyActiveUser, userData.toJson());
        }
      }
      return (true, "User login sucsess");
    } catch (e) {
      log(e.toString(), name: "ApiAuthRepository:login");
      return (false, e.toString());
    }
  }

  @override
  Future logout() async {
    try {
      final spm = await SharedPreferencesManager.getInstance();
      if (spm != null) {
        await spm.clearAll();
      }
    } catch (e) {
      log(e.toString(), name: "ApiAuthRepository:logout");
    }
  }

  @override
  Future<bool> refreshToken() {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<(bool, String)> register(UserRegisterDto dataRegister) {
    // TODO: implement register
    throw UnimplementedError();
  }

  DateTime? _getExpiryDate(String token) {
    final decodedToken = JwtDecoder.decode(token);
    if (decodedToken.isNotEmpty && decodedToken.containsKey("exp")) {
      int expirationTime = decodedToken["exp"];
      return DateTime.fromMillisecondsSinceEpoch(expirationTime * 1000);
    }
    return null;
  }
}
