import 'dart:async';

import 'package:display_app/models/staff.dart';
import 'package:display_app/widgets/build_dots.dart';
import 'package:flutter/material.dart';

class StaffContainer extends StatefulWidget {
  const StaffContainer(
      {super.key,
      required this.staffs,
      required this.height,
      required this.width});

  final List<Staff> staffs;
  final double height;
  final double width;

  @override
  State<StaffContainer> createState() => _StaffContainerState();
}

class _StaffContainerState extends State<StaffContainer> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (t) {
      if (index == widget.staffs.length - 1) {
        index = 0;
      } else {
        index++;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    var finalWidth = widget.width - 10;
    return Stack(
      children: [
        Container(
          height: widget.height - 4,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
          ),
          width: widget.width,
          margin: const EdgeInsets.only(
            top: 4,
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            width: finalWidth,
            height: widget.height - 16,
            margin: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 4),
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 4,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.memory(
                  widget.staffs[index].image!,
                  width: finalWidth * 0.5,
                  height: widget.height - 26,
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: finalWidth * 0.5 - 15,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.staffs[index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        getTextDetail(widget.staffs[index].designation),
                        getTextDetail(widget.staffs[index].phone.first),
                        getTextDetail(
                          "कोठा नं : ${widget.staffs[index].roomNo}",
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          right: widget.width * .3,
          // left: widget.width * .4,
          // left: 0,
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
            child: BuildDots(
              index: index,
              list: widget.staffs,
            ),
          ),
        ),
      ],
    );
  }

  Widget getTextDetail(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 11),
    );
  }
}
