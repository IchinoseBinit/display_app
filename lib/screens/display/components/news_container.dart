import 'package:display_app/constants/constant.dart';
import 'package:display_app/models/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewsContainer extends StatelessWidget {
  const NewsContainer({super.key, required this.news, required this.height});

  final List<News> news;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 4,
        left: 4,
      ),
      height: height - 4,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: news
              .map(
                (e) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      color: baseColor,
                      padding: const EdgeInsets.all(1),
                      margin: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        e.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(e.description)
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
