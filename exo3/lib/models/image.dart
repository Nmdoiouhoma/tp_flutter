class Image {
  final String id;
  final String url;

  Image({
    required this.id,
    required this.url,
  });

  factory Image.fromMap(Map<String, dynamic> map) {
    return Image(
      id: map['id'] ?? '',
      url: map['url'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Image: $url';
  }
}
