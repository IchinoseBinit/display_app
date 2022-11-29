import 'package:display_app/utils/base64_to_img.dart';
import 'package:flutter/foundation.dart';

class Branch {
  late final String officeName;
  late final String name;
  late final String address;
  late final String geoMap;
  late final Uint8List image;
  late final List<dynamic> phone;

  Branch.fromJson(Map obj) {
    officeName = obj["main_office_name"];
    name = obj["name"];
    address = obj["address"];
    geoMap = obj["geo_map"];
    phone = obj["phone_number"];
    image = imageFromBase64String(obj["image"]);
  }
}
