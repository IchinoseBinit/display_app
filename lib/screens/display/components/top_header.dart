import 'package:display_app/models/branch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nepali_utils/nepali_utils.dart';

import '/constants/constant.dart';
import 'package:flutter/material.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({
    super.key,
    required this.height,
    required this.temp,
    required this.branch,
  });

  final double height;
  final int temp;
  final Branch branch;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 32;
    return Container(
      height: height,
      width: width + 32,
      color: baseColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TopLeftWidget(width: width),
            TopCenterWidget(width: width, branch: branch, height: height),
            TopRightWidget(width: width, temp: temp)
          ],
        ),
      ),
    );
  }
}

class TopCenterWidget extends StatelessWidget {
  const TopCenterWidget({
    Key? key,
    required this.width,
    required this.branch,
    required this.height,
  }) : super(key: key);

  final double width;
  final Branch branch;
  final double height;

  @override
  Widget build(BuildContext context) {
    var phone = "";
    for (var e in branch.phone) {
      phone += "$e";
      if (branch.phone.last != e) {
        phone = "$phone/";
      }
    }
    return SizedBox(
      width: width * .5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.memory(
                branch.image,
                height: 22.h,
                width: 22.h,
              ),
              SizedBox(
                width: 3.w,
              ),
              const Text(
                "Kush Tech",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            "${branch.name}, ${branch.address}",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Text(
            phone,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class TopRightWidget extends StatelessWidget {
  const TopRightWidget({
    Key? key,
    required this.width,
    required this.temp,
  }) : super(key: key);

  final double width;
  final int temp;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * .25,
      alignment: Alignment.centerRight,
      child: Text(
        "$temp\u2103",
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class TopLeftWidget extends StatelessWidget {
  const TopLeftWidget({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * .25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${NepaliDateFormat(
              "yyyy-MM-dd",
              Language.nepali,
            ).format(
              DateTime.now().toNepaliDateTime(),
            )} गते",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Text(
            NepaliDateFormat(
              "EEE,a,hh:mm",
              Language.nepali,
            ).format(
              DateTime.now().toNepaliDateTime(),
            ),
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
