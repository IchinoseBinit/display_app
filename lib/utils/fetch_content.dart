import 'dart:developer';

import 'package:display_app/api/weather_data_api.dart';
import 'package:geolocator/geolocator.dart';

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
  fetchAllContent(
    BuildContext context,
    Position? position,
  ) async {
    final newsList = await NewsApi().fetch();
    final notice = await NoticeApi().fetch();
    final branch = await BranchesApi().fetch();
    final images = await ImagesApi().fetch();
    final videos = await VideosApi().fetch();
    final staffList = await StaffApi().fetch();
    var temp = 0;
    if (position != null)
      temp = (await WeatherDataApi()
              .fetchWeatherInfo(position.latitude, position.longitude))
          .toInt();

    navigateReplacement(
      context,
      DisplayScreen(
        branch: branch,
        images: images,
        news: newsList,
        notice: notice,
        staff: staffList,
        videos: videos,
        temp: temp,
      ),
    );
  }
}
