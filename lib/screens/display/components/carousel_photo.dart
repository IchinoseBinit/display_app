import 'package:carousel_slider/carousel_slider.dart';
import 'package:display_app/constants/constant.dart';
import 'package:display_app/models/images.dart';
import 'package:flutter/material.dart';

class CarouselPhoto extends StatefulWidget {
  const CarouselPhoto({super.key, required this.images, required this.width});

  final Images images;
  final double width;

  @override
  State<CarouselPhoto> createState() => _CarouselPhotoState();
}

class _CarouselPhotoState extends State<CarouselPhoto> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          color: Colors.red,
          width: widget.width,
          child: CarouselSlider.builder(
            itemCount: widget.images.images.length,
            itemBuilder: (BuildContext context, int i, int index) {
              return Image.memory(
                widget.images.images[i],
                fit: BoxFit.fitWidth,
                width: widget.width,
              );
            },
            options: CarouselOptions(
              initialPage: 0,
              onPageChanged: (index, _) => setState(
                () {
                  this.index = index;
                },
              ),
              viewportFraction: 1,
              aspectRatio: 1.6,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        Align(
          heightFactor: 3,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                8,
              ),
              color: Colors.grey.withOpacity(0.15),
            ),
            child: buildDots(index),
          ),
        ),
      ],
    );
  }

  Widget buildDots(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: widget.images.images
          .map(
            (e) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 4,
              width: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  4,
                ),
                color: widget.images.images.indexOf(e) == index
                    ? baseColor
                    : Colors.grey,
              ),
            ),
          )
          .toList(),
    );
  }
}
