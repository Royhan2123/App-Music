import 'package:application_music/model/users_models.dart';

class AuthgetResponse {
  final bool? succes;
  final String? message;
  final UsersModels? data;

  const AuthgetResponse({
    this.succes,
    this.message,
    this.data,
  });

  factory AuthgetResponse.fromJson(Map<String, dynamic> json) {
    return AuthgetResponse(
      succes: json['succes'],
      message: json["message"],
      data: json["data"] != null
          ? UsersModels.fromJson(
              json["data"],
            )
          : null,
    );
  }
}
