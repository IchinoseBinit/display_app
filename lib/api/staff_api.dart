import 'dart:developer';

import '/models/staff.dart';

import '/constants/urls.dart';
import '/utils/dio_client.dart';
import '/utils/request_type.dart';

class StaffApi {
  Future<List<Staff>> fetch() async {
    try {
      final resp = await DioClient().request(
        requestType: RequestType.getWithToken,
        url: ApiEndpoints.staffUrl,
      );
      final list = <Staff>[];
      for (var staff in resp.data) {
        list.add(Staff.fromJson(staff));
      }
      return list;
    } catch (ex) {
      print(ex.toString());
      return <Staff>[];
    }
  }
}
