import '/models/branch.dart';

import '/constants/urls.dart';
import '/utils/dio_client.dart';
import '/utils/request_type.dart';

class BranchesApi {
  Future<Branch> fetch() async {
    try {
      final resp = await DioClient().request(
        requestType: RequestType.getWithToken,
        url: ApiEndpoints.branchUrl,
      );
      return Branch.fromJson(resp.data);
    } catch (ex) {
      print(ex.toString());
      rethrow;
    }
  }
}
