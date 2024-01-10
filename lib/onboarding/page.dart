import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final Image image;
  final int currentPage;
  final int pageCount;

  const OnboardingPage({
   super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.currentPage,
    required this.pageCount
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(50),
            alignment: Alignment.center,
            child: image,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                description,
                style: const TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
              DotsIndicator(
                dotsCount: pageCount,
                position: currentPage.toInt(),
                decorator: const DotsDecorator(
                  color: Colors.lightBlue,
                  activeColor: Colors.red
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
