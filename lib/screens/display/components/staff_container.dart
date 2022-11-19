import 'package:display_app/models/staff.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StaffContainer extends StatelessWidget {
  const StaffContainer({super.key, required this.staffs});

  final List<Staff> staffs;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.center,
      children: staffs
          .map(
            (e) => Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(e.designation),
                  Text(e.phone.first),
                  Text("कोठा नं : ${e.roomNo}")
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
