import 'package:display_app/models/images.dart';
import 'package:display_app/models/news.dart';
import 'package:display_app/models/staff.dart';
import 'package:display_app/models/video.dart';
import 'package:display_app/screens/display/components/image_video_container.dart';
import 'package:display_app/screens/display/components/news_container.dart';
import 'package:display_app/screens/display/components/staff_container.dart';

import '/screens/display/components/carousel_photo.dart';
import '/screens/display/components/video_content.dart';
import 'package:flutter/cupertino.dart';

class BodyContent extends StatelessWidget {
  const BodyContent(
      {super.key,
      required this.height,
      required this.videos,
      required this.notice,
      required this.images,
      required this.staff});

  final double height;
  final List<Video> videos;
  final List<News> notice;
  final Images images;
  final List<Staff> staff;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 32;
    return Container(
      height: height,
      width: width + 32,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          SizedBox(
            width: width * .33,
            child: Column(
              children: [
                SizedBox(
                  height: height * .65,
                  child: ImageVideoContainer(
                    images: images,
                    width: width,
                    videos: videos,
                  ),
                ),
                StaffContainer(
                  staffs: staff,
                  height: height * .35,
                  width: width * .33,
                ),
              ],
            ),
          ),
          SizedBox(
            width: width * .67,
            child: NewsContainer(
              news: notice,
              height: height,
            ),
            //     Column(
            // children: [
            //   // SizedBox(
            //   //   height: height * .5,
            //   //   child: VideoContent(
            //   //     video: videos.last,
            //   //   ),
            //   // ),
            //   SizedBox(
            //     height: height,
            //     child:
            //   )
            // ],
            // ),
          )
        ],
      ),
    );
  }
}
