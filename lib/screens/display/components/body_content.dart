import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BodyContent extends StatelessWidget {
  const BodyContent({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height,
      width: width,
      child: Row(
        children: [
          SizedBox(
            width: width * .5,
            child: Column(
              children: [],
            ),
          ),
          SizedBox(
            width: width * .5,
            child: Column(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
