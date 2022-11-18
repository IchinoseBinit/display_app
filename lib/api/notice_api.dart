import '/models/news.dart';

import '/constants/urls.dart';
import '/utils/dio_client.dart';
import '/utils/request_type.dart';

class NoticeApi {
  fetch() async {
    final resp = await DioClient().request(
      requestType: RequestType.getWithToken,
      url: ApiEndpoints.noticeUrl,
    );
    return News.fromJson(resp.data);
  }
}
