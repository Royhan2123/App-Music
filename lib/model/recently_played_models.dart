class RecentlyPlayedModels {
  final List<String>? image;
  final List<String>? name;

  const RecentlyPlayedModels({
    this.image,
    this.name,
  });

  factory RecentlyPlayedModels.fromJson(Map<String, dynamic> json) {
    return RecentlyPlayedModels(
      image: List<String>.from(json['images'] ?? []),
      name: List<String>.from(json['name'] ?? []),
    );
  }
}
