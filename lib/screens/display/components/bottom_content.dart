import 'dart:developer';

import 'package:display_app/models/news.dart';
import 'package:marquee/marquee.dart';

import '/constants/constant.dart';
import 'package:flutter/material.dart';

class BottomContent extends StatelessWidget {
  const BottomContent({
    super.key,
    required this.height,
    required this.news,
  });

  final double height;
  final List<News> news;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    String? message;
    if (news.isNotEmpty) {
      message = news
          .map((e) => "${e.name}:- ${e.description}")
          .toList()
          .join("\t\t\t\t");
    }
    log(message ?? "", name: "message");
    return Container(
      height: height,
      width: width,
      color: baseColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: height,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: baseColor,
            child: const Center(
              child: Text(
                "सूचना",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              alignment: Alignment.center,
              padding:
                  message != null ? EdgeInsets.only(top: height * .2) : null,
              child: message != null
                  ? Marquee(
                      text: message,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),

                      scrollAxis: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      blankSpace: 20.0,
                      velocity: 80.0,
                      pauseAfterRound: const Duration(seconds: 1),
                      showFadingOnlyWhenScrolling: true,
                      fadingEdgeStartFraction: 0.1,
                      fadingEdgeEndFraction: 0.1,
                      // startPadding: 10.0,
                      accelerationDuration: const Duration(seconds: 3),
                      accelerationCurve: Curves.linear,
                      decelerationDuration: const Duration(milliseconds: 500),
                      decelerationCurve: Curves.easeOut,
                    )
                  : const Text(
                      "No Message!!!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
