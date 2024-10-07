class AuthResponse {
  final bool? succes;
  final String? message;
  final String? token;

  const AuthResponse({
    this.token,
    this.message,
    this.succes,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json["data"]["token"],
      message: json["message"],
      succes: json["succes"],
    );
  }
}
