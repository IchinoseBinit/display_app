import '/constants/urls.dart';
import '/models/images.dart';
import '/utils/dio_client.dart';
import '/utils/request_type.dart';

class ImagesApi {
  fetch() async {
    final resp = await DioClient().request(
      requestType: RequestType.getWithToken,
      url: ApiEndpoints.imagesUrl,
    );
    return Images.fromMap(resp.data);
  }
}
