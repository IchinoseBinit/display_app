import 'package:display_app/utils/base64_to_img.dart';
import 'package:flutter/foundation.dart';

class Staff {
  late final String name;
  late final String roomNo;
  late final String designation;
  late final List<dynamic> phone;
  late final Uint8List? image;

  Staff.fromJson(Map obj) {
    name = obj["name"];
    roomNo = obj["room_no"];
    designation = obj["designation"];
    phone = obj["phone_number"];
    image = imageFromBase64String(obj["image"]);
  }
}
