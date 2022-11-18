import '/constants/constant.dart';
import 'package:flutter/material.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({
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
          SizedBox(
            width: width * .25,
          ),
          SizedBox(
            width: width * .5,
          ),
          SizedBox(
            width: width * .25,
          )
        ],
      ),
    );
  }
}
