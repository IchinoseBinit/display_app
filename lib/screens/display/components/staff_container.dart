import 'package:display_app/models/staff.dart';
import 'package:flutter/material.dart';

class StaffContainer extends StatelessWidget {
  const StaffContainer(
      {super.key,
      required this.staffs,
      required this.height,
      required this.width});

  final List<Staff> staffs;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    var finalWidth = (width / 2) - 8;
    return Container(
      height: height - 8,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      width: width,
      margin: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: staffs.length > 2 ? 2 : staffs.length,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          width: finalWidth,
          height: height - 16,
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
                staffs[index].image!,
                width: finalWidth * 0.3,
                height: height - 26,
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
                        staffs[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      getTextDetail(staffs[index].designation),
                      getTextDetail(staffs[index].phone.first),
                      getTextDetail(
                        "कोठा नं : ${staffs[index].roomNo}",
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
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
