import 'package:display_app/models/staff.dart';
import 'package:flutter/material.dart';

class StaffContainer extends StatelessWidget {
  const StaffContainer({super.key, required this.staffs, required this.height});

  final List<Staff> staffs;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height - 4,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      width: double.infinity,
      margin: const EdgeInsets.only(top: 4),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.center,
        children: staffs
            .map(
              (e) => Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                height: height - 16,
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.memory(
                      e.image!,
                      // width: MediaQuery.of(context).size.width / 2 * 0.2,
                      height: height - 26,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
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
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
