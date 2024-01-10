// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:helathcareapp/onboarding/page.dart';

class OnboardingScreen extends StatefulWidget {
  final VoidCallback onDone;

  const OnboardingScreen({super.key, required this.onDone});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _pages = [
    OnboardingPage(
        title: 'Welcome to Smilynks App',
        description: '',
        image: Image.asset('asset/talking.png'),
        currentPage: 0,
        pageCount: 3
    ),
    OnboardingPage(
        title: 'Explore the Features',
        description: 'Discover what you need',
        image: Image.asset('asset/inpatients.jpg'),
        currentPage: 1,
        pageCount: 3),
    OnboardingPage(
        title: 'Get Started',
        description: "Let's Go",
        image: Image.asset('asset/happy.png'),
        currentPage: 2,
        pageCount: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return _pages[index];
              }
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentPage != 0)
                    ElevatedButton(
                        onPressed: () {
                          _pageController.previousPage(
                              duration: const Duration(milliseconds:  200),
                              curve: Curves.easeInOut
                          );
                        },
                        child: const Text('Previous'),
                    ),
                  const Spacer(),
                  if (_currentPage != _pages.length - 1)
                    ElevatedButton(
                        onPressed: () {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds:  200),
                              curve: Curves.easeInOut
                          );
                        },
                      child: const Text('Next'),
                    ),
                  if (_currentPage == _pages.length - 1)
                    ElevatedButton(
                        onPressed: widget.onDone,
                        child: const Text('Get Started')
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
