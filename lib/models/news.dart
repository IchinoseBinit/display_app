class News {
  late final String name;
  late final String description;
  late final String startDate;
  late final String endDate;

  News.fromJson(Map obj) {
    name = obj["name"];
    description = obj["description"];
    startDate = obj["start_date"];
    endDate = obj["end_date"];
  }
}
