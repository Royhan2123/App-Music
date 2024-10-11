import 'package:application_music/model/users_models.dart';
import 'package:application_music/services/auth_services.dart';
import 'package:dio/dio.dart';

class UserServices {
  final dio = Dio();
  final String url = 'https://login-api.my.id/api';

  Future<UsersModels> getUser() async {
    try {
      final token = await AuthServices().getToken();

      final response = await dio.post(
        "$url/me",
        options: Options(
          headers: {
            'Authorization': "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200 && response.data['data'] != null) {
        return UsersModels.fromJson(
          response.data['data'],
        );
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
