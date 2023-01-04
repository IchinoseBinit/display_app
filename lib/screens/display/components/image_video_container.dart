import 'package:display_app/models/images.dart';
import 'package:display_app/models/video.dart';
import 'package:display_app/screens/display/components/carousel_photo.dart';
import 'package:display_app/screens/display/components/video_content.dart';
import 'package:flutter/material.dart';

class ImageVideoContainer extends StatefulWidget {
  const ImageVideoContainer(
      {super.key,
      required this.images,
      required this.width,
      required this.videos});

  final Images images;
  final double width;
  final List<Video> videos;

  @override
  State<ImageVideoContainer> createState() => _ImageVideoContainerState();
}

class _ImageVideoContainerState extends State<ImageVideoContainer> {
  late bool showImage;

  toggleImageVideoView() {
    if (widget.videos.isNotEmpty && widget.images.images.isNotEmpty) {
      setState(() {
        showImage = !showImage;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    showImage = widget.images.images.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return widget.images.images.isEmpty && widget.videos.isEmpty
        ? const Center(
            child: Text("No images or videos to show"),
          )
        : showImage
            ? CarouselPhoto(
                images: widget.images,
                width: widget.width,
                function: toggleImageVideoView,
              )
            : VideoContent(
                video: widget.videos.last,
                callback: toggleImageVideoView,
              );
  }
}
