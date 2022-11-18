import '/models/staff.dart';

import '/constants/urls.dart';
import '/utils/dio_client.dart';
import '/utils/request_type.dart';

class StaffApi {
  fetch() async {
    final resp = await DioClient().request(
      requestType: RequestType.getWithToken,
      url: ApiEndpoints.staffUrl,
    );
    final list = [];
    for (var news in resp.data) {
      list.add(Staff.fromJson(news));
    }
    return list;
  }
}
