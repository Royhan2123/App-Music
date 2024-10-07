class RegisterModels {
  final String? name;
  final String? email;
  final String? password;

  const RegisterModels({
    this.name,
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
      };
}
