class FeaturingTodayModels {
  final List<String>? images;

  const FeaturingTodayModels({
    this.images,
  });

  factory FeaturingTodayModels.fromJson(Map<String, dynamic> json) {
    return FeaturingTodayModels(
      images: List<String>.from(
        json['images'] ?? [],
      ),
    );
  }
}
