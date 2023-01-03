import 'dart:convert';
import 'dart:developer';

import '/constants/urls.dart';
import '/models/notice.dart';
import '/utils/dio_client.dart';
import '/utils/request_type.dart';

class NoticeApi {
  Future<List<Notice>> fetch() async {
    try {
      final resp = await DioClient().request(
        requestType: RequestType.getWithToken,
        url: ApiEndpoints.noticeUrl,
      );
      final list = <Notice>[];
      for (var news in resp.data) {
        list.add(Notice.fromJson(news));
      }
      return list;
    } catch (ex) {
      print(ex.toString());
      return <Notice>[];
    }
  }
}
