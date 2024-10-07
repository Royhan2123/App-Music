class UsersModels {
  final int? id;
  final String? name;
  final String? email;

  const UsersModels({
    this.id,
    this.name,
    this.email,
  });

  factory UsersModels.fromJson(
    Map<String, dynamic> json,
  ) {
    return UsersModels(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
