import '/models/branch.dart';

import '/constants/urls.dart';
import '/utils/dio_client.dart';
import '/utils/request_type.dart';

class BranchesApi {
  fetch() async {
    final resp = await DioClient().request(
      requestType: RequestType.getWithToken,
      url: ApiEndpoints.branchUrl,
    );
    final list = [];
    for (var branch in resp.data) {
      list.add(Branch.fromJson(branch));
    }
    return list;
  }
}
