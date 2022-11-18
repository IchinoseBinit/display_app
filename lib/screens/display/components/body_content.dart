import '/screens/display/components/carousel_photo.dart';
import '/screens/display/components/video_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BodyContent extends StatelessWidget {
  const BodyContent({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height,
      width: width,
      child: Row(
        children: [
          SizedBox(
            width: width * .5,
            child: Column(
              children: [
                SizedBox(
                  height: height * .7,
                  child: CarouselPhoto(),
                ),
              ],
            ),
          ),
          SizedBox(
            width: width * .5,
            child: Column(
              children: [
                SizedBox(
                  height: height * .4,
                  child: VideoContent(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
