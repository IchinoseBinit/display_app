import '/constants/urls.dart';
import '/models/news.dart';
import '/utils/dio_client.dart';
import '/utils/request_type.dart';

class NewsApi {
  fetch() async {
    final resp = await DioClient().request(
      requestType: RequestType.getWithToken,
      url: ApiEndpoints.newsUrl,
    );
    final list = [];
    for (var news in resp.data) {
      list.add(News.fromJson(news));
    }
    return list;
  }
}
