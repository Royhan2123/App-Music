class FeaturingTodayModels {
  final List<String>? images;
  final List<String>? name;

  const FeaturingTodayModels({
    this.images,
    this.name,
  });

  factory FeaturingTodayModels.fromJson(Map<String, dynamic> json) {
    return FeaturingTodayModels(
      images: List<String>.from(json['images'] ?? []),
      name: List<String>.from(json['name'] ?? []),
    );
  }
}
