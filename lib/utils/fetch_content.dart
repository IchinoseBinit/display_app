import 'dart:developer';

import '/api/branch_api.dart';
import '/api/images_api.dart';
import '/api/news_api.dart';
import '/api/notice_api.dart';
import '/api/staff_api.dart';
import '/api/videos_api.dart';
import '/screens/display/display_screen.dart';
import '/utils/navigate.dart';
import 'package:flutter/material.dart';

class FetchContent {
  fetchAllContent(BuildContext context) async {
    final newsList = await NewsApi().fetch();
    final notice = await NoticeApi().fetch();
    final branch = await BranchesApi().fetch();
    final images = await ImagesApi().fetch();
    final videos = await VideosApi().fetch();
    final staffList = await StaffApi().fetch();
    log("message");
    print(newsList);
    print(notice);
    print(branch);
    print(images);
    print(videos);
    print(staffList);

    navigateReplacement(
      context,
      DisplayScreen(
        branch: branch,
        images: images,
        news: newsList,
        notice: notice,
        staff: staffList,
        videos: videos,
      ),
    );
  }
}
