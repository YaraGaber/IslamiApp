class RadioStation {
  final String title;
  final String name;
  final String? url; // Make sure to handle nullability if needed

  RadioStation({required this.title, required this.name, this.url});

  factory RadioStation.fromJson(Map<String, dynamic> json) {
    return RadioStation(
      title: json['title'] ?? '',
      name: json['name'] ?? '',
      url: json['url'],
    );
  }
}
