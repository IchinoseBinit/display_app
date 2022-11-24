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
    return SingleChildScrollView(
      child: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: news
              .map(
                (e) => Text(
                  "${e.name}\n${e.description}",
                  textAlign: TextAlign.justify,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
