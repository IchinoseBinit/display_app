class Video {
  late final String? media;
  late final String link;

  Video.fromJson(Map obj) {
    media = obj["media"];
    link = obj["link"];
  }
}
