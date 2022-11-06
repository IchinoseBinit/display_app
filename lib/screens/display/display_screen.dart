import 'package:display_app/constants/constant.dart';
import 'package:display_app/screens/display/components/body_content.dart';
import 'package:display_app/screens/display/components/top_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DisplayScreen extends StatelessWidget {
  const DisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopHeader(
                height: height * .2,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              BodyContent(
                height: height - ((height * .2) + (height * .05)),
              ),
            ],
          );
        },
      ),
    );
  }
}
