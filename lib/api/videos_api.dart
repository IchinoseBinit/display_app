import 'package:display_app/models/video.dart';

import '/constants/urls.dart';
import '/models/images.dart';
import '/utils/dio_client.dart';
import '/utils/request_type.dart';

class VideosApi {
  Future<List<Video>> fetch() async {
    try {
      final resp = await DioClient().request(
        requestType: RequestType.getWithToken,
        url: ApiEndpoints.videosUrl,
      );
      final list = <Video>[];
      for (var v in resp.data) {
        list.add(Video.fromJson(v));
      }
      return list;
    } catch (ex) {
      print(ex.toString());
      return <Video>[];
    }
  }
}
