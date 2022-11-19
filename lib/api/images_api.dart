import '/constants/urls.dart';
import '/models/images.dart';
import '/utils/dio_client.dart';
import '/utils/request_type.dart';

class ImagesApi {
  Future<Images> fetch() async {
    try {
      final resp = await DioClient().request(
        requestType: RequestType.getWithToken,
        url: ApiEndpoints.imagesUrl,
      );
      return Images.fromMap(resp.data);
    } catch (ex) {
      print(ex.toString());
      rethrow;
    }
  }
}
