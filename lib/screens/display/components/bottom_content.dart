import '/constants/constant.dart';
import 'package:flutter/material.dart';

class BottomContent extends StatelessWidget {
  const BottomContent({
    super.key,
    required this.height,
  });

  final double height;

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
            padding: const EdgeInsets.symmetric(horizontal: 8),
            color: Colors.black,
            child: const Text(
              "सूचना",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
              child: Container(
            color: baseColor,
            child: const Text(
              "No Message",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
