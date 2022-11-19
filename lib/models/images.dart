import '/utils/base64_to_img.dart';
import 'package:flutter/foundation.dart';

class Images {
  final List<Uint8List> images = [];

  Images.fromMap(Map obj) {
    for (var img in obj["images"]) {
      images.add(imageFromBase64String(img["img"]));
    }
  }
}
