class Staff {
  late final String name;
  late final String roomNo;
  late final String designation;
  late final List<dynamic> phone;

  Staff.fromJson(Map obj) {
    name = obj["name"];
    roomNo = obj["room_no"];
    designation = obj["designation"];
    phone = obj["phone_number"];
  }
}
