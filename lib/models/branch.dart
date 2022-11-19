class Branch {
  late final String name;
  late final String address;
  late final String geoMap;
  late final List<dynamic> phone;

  Branch.fromJson(Map obj) {
    name = obj["name"];
    address = obj["address"];
    geoMap = obj["geo_map"];
    phone = obj["phone_number"];
  }
}
