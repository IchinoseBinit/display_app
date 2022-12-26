import 'dart:async';

import 'package:display_app/models/staff.dart';
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
    return Container(
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
              width: finalWidth * 0.3,
              height: widget.height - 26,
            ),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: finalWidth * 0.7 - 15,
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
    );
  }

  Widget getTextDetail(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 11),
    );
  }
}
