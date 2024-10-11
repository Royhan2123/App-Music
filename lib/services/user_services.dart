import 'package:application_music/model/users_models.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserServices {
  final dio = Dio();
  final String url = 'https://login-api.my.id/api';

  Future<UsersModels> getUser() async {
    try {
      const storage = FlutterSecureStorage();

      String? token = await storage.read(
        key: 'token',
      );
      print(
        "Token: $token",
      );

      final response = await dio.post(
        "$url/me",
        options: Options(
          headers: {
            'Authorization': "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200 && response.data['data'] != null) {
        print(
          "Data yang di ambil: ${response.data}",
        );
        return UsersModels.fromJson(response.data['data']);
      } else {
        throw Exception(
            'Failed to load user data: ${response.data['message']}');
      }
    } catch (e) {
      throw Exception(
        "Error: $e",
      );
    }
  }
}
