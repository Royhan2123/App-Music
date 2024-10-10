import 'package:application_music/model/login_models.dart';
import 'package:application_music/model/register_models.dart';
import 'package:application_music/response/auth_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthServices {
  final String url = 'https://login-api.my.id/api';
  final dio = Dio();

  Future<AuthResponse> login(LoginModels data) async {
    try {
      final response = await dio.post("$url/login", data: data.toJson());

      if (response.statusCode == 200) {
        final authResponse = AuthResponse.fromJson(
          response.data,
        );
        await storeCredentialToLocal(
          authResponse,
        );
        return authResponse;
      } else {
        throw Exception(
          response.data["message"],
        );
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<AuthResponse> register(
    RegisterModels data,
  ) async {
    try {
      final response = await dio.post(
        "$url/register",
        data: data.toJson(),
      );

      if (response.statusCode == 200) {
        final authResponse = AuthResponse.fromJson(
          response.data,
        );
        await storeCredentialToLocal(
          authResponse,
        );
        return authResponse;
      } else {
        throw Exception(
          response.data["message"],
        );
      }
    } catch (e) {
      throw e.toString();
    }
  }
  
  Future<void> logout() async {
    try {
      final token = await getToken();

      if (token.isNotEmpty) {
        final response = await dio.post(
          "$url/logout",
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
        );

        if (response.statusCode == 200) {
          await clearLocalStorage();
        } else {
          throw Exception(
            "Failed to logout ${response.data["message"]}",
          );
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> storeCredentialToLocal(AuthResponse response) async {
    try {
      const storage = FlutterSecureStorage();

      if (response.token != null) {
        await storage.write(
          key: "token",
          value: response.token,
        );
      } else {
        throw Exception(
          'Token Not Found',
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getToken() async {
    String token = '';

    const storage = FlutterSecureStorage();

    String? value = await storage.read(
      key: 'token',
    );

    if (value != null) {
      token = value;
    }

    return token;
  }

  Future<void> clearLocalStorage() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }
}
