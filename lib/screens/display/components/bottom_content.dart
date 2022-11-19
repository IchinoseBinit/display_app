import 'package:display_app/models/news.dart';

import '/constants/constant.dart';
import 'package:flutter/material.dart';

class BottomContent extends StatelessWidget {
  const BottomContent({
    super.key,
    required this.height,
    required this.notice,
  });

  final double height;
  final News? notice;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
            color: Colors.black,
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
            color: baseColor,
            child: Center(
              child: Text(
                notice?.name ?? "No Message",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
