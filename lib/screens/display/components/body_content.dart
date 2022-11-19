import 'package:display_app/models/images.dart';
import 'package:display_app/models/news.dart';
import 'package:display_app/models/staff.dart';
import 'package:display_app/models/video.dart';
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
      required this.news,
      required this.images,
      required this.staff});

  final double height;
  final List<Video> videos;
  final List<News> news;
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
            width: width * .5,
            child: Column(
              children: [
                SizedBox(
                  height: height * .65,
                  child: CarouselPhoto(
                    images: images,
                    width: width,
                  ),
                ),
                SizedBox(
                  height: height * .35,
                  child: StaffContainer(
                    staffs: staff,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: width * .5,
            child: Column(
              children: [
                SizedBox(
                  height: height * .5,
                  child: VideoContent(
                    video: videos.last,
                  ),
                ),
                SizedBox(
                  height: height * .5,
                  child: NewsContainer(
                    news: news,
                    height: height * .5,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
