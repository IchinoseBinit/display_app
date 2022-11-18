import '/constants/urls.dart';
import '/models/images.dart';
import '/utils/dio_client.dart';
import '/utils/request_type.dart';

class VideosApi {
  fetch() async {
    final resp = await DioClient().request(
      requestType: RequestType.getWithToken,
      url: ApiEndpoints.videosUrl,
    );
    final list = [];
    for (var v in resp.data) {
      list.add(Images.fromMap(v));
    }
    return list;
  }
}
