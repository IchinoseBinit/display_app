import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';

import '/models/branch.dart';
import '/models/images.dart';
import '/models/news.dart';
import '/models/staff.dart';
import '/models/video.dart';
import '/screens/display/components/body_content.dart';
import '/screens/display/components/bottom_content.dart';
import '/screens/display/components/top_header.dart';

class DisplayScreen extends StatelessWidget {
  const DisplayScreen({
    super.key,
    required this.branch,
    required this.videos,
    required this.news,
    required this.images,
    required this.staff,
    required this.notice,
    required this.temp,
  });

  final Branch branch;
  final List<Video> videos;
  final List<News> notice;
  final Images images;
  final List<Staff> staff;
  final List<News> news;
  final int temp;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopHeader(
                height: height * .23,
                branch: branch,
                temp: temp,
              ),
              SizedBox(
                height: height * 0.015,
              ),
              BodyContent(
                height:
                    height - ((height * .23) + (height * .03) + (height * .08)),
                videos: videos,
                notice: notice,
                staff: staff,
                images: images,
              ),
              SizedBox(
                height: height * 0.015,
              ),
              BottomContent(
                height: height * .08,
                news: news,
              ),
            ],
          );
        },
      ),
    );
  }
}
