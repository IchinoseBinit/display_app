import '/constants/urls.dart';
import '/models/news.dart';
import '/utils/dio_client.dart';
import '/utils/request_type.dart';

class NewsApi {
  Future<List<News>> fetch() async {
    try {
      final resp = await DioClient().request(
        requestType: RequestType.getWithToken,
        url: ApiEndpoints.newsUrl,
      );
      final list = <News>[];
      for (var news in resp.data) {
        list.add(News.fromJson(news));
      }
      return list;
    } catch (ex) {
      print(ex.toString());
      return <News>[];
    }
  }
}
