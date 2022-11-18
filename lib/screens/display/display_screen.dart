import '/models/branch.dart';
import '/models/images.dart';
import '/models/news.dart';
import '/models/staff.dart';
import '/models/video.dart';
import '/screens/display/components/body_content.dart';
import '/screens/display/components/bottom_content.dart';
import '/screens/display/components/top_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class DisplayScreen extends StatelessWidget {
  const DisplayScreen({
    super.key,
    required this.branches,
    required this.videos,
    required this.news,
    required this.images,
    required this.staff,
    required this.notice,
  });

  final List<Branch> branches;
  final List<Video> videos;
  final List<News> news;
  final Images images;
  final List<Staff> staff;
  final News notice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopHeader(
                height: height * .2,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              BodyContent(
                height:
                    height - ((height * .24) + (height * .6) + (height * .15)),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              BottomContent(
                height: height * .15,
              ),
            ],
          );
        },
      ),
    );
  }
}
