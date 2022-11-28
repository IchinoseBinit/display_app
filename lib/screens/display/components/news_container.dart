import 'package:display_app/constants/constant.dart';
import 'package:display_app/models/news.dart';
import 'package:flutter/material.dart';

class NewsContainer extends StatefulWidget {
  const NewsContainer({super.key, required this.news, required this.height});

  final List<News> news;
  final double height;

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  late ScrollController controller;

  bool scrollForward = true;

  @override
  void initState() {
    super.initState();
    controller = ScrollController()
      ..addListener(() {
        if (scrollForward) {
          controller
              .animateTo(controller.offset + 200,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut)
              .then((_) {
            if (controller.offset > controller.position.maxScrollExtent - 5) {
              Future.delayed(
                const Duration(seconds: 2),
                () {
                  setState(() => scrollForward = false);
                  controller.animateTo(controller.offset - 200,
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOut);
                },
              );
            }
          });
        } else {
          controller
              .animateTo(controller.offset - 200,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut)
              .then((_) {
            if (controller.offset < controller.position.minScrollExtent + 5) {
              Future.delayed(
                const Duration(seconds: 2),
                () {
                  setState(() => scrollForward = true);
                  controller.animateTo(controller.offset + 200,
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOut);
                },
              );
            } else {
              controller.animateTo(controller.offset - 200,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut);
            }
          });
        }
      });
    Future.delayed(
        Duration(seconds: 2),
        () => controller.animateTo(controller.initialScrollOffset + 200,
            duration: Duration(milliseconds: 800), curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 4,
        left: 4,
      ),
      height: widget.height - 4,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.news
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
