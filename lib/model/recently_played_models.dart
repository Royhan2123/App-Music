class RecentlyPlayedModels {
  final List<String>? image;
  final List<String>? name;
  final List<String>? artist;
  final List<String>? deskripsi;
  

  const RecentlyPlayedModels({
    this.image,
    this.name,
    this.artist,
    this.deskripsi,
  });

  factory RecentlyPlayedModels.fromJson(Map<String, dynamic> json) {
    return RecentlyPlayedModels(
      image: List<String>.from(json['images'] ?? []),
      name: List<String>.from(json['name'] ?? []),
      artist: List<String>.from(json['artist'] ?? []),
      deskripsi: List<String>.from(json['deskripsi'] ?? []),
    );
  }
}
