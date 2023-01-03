class Notice {
  late final int id;
  late final String name;
  late final String createdAt;
  late final List<Content> contents;

  Notice.fromJson(Map obj) {
    id = obj["id"] ?? 0;
    contents =
        List.from(obj["content"]).map((e) => Content.fromJson(e)).toList();
    name = obj["name"] ?? "";
    createdAt = obj["created_at"] ?? "";
  }
}

class Content {
  late final String subtitle;
  late final String description;

  Content.fromJson(Map obj) {
    subtitle = obj["sub_title"] ?? "";
    description = obj["description"] ?? "";
  }
}
