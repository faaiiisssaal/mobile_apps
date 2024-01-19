// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:helathcareapp/feature/auth/presentation/pages/onboarding/page.dart';

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
        pageCount: 4),
    OnboardingPage(
        title: 'Explore the App',
        description: 'Discover what you need',
        image: Image.asset('asset/inpatients.jpg'),
        currentPage: 1,
        pageCount: 4),
    OnboardingPage(
        title: '24/7',
        description: 'Smilynks app is ready 24/7 to deliver our service',
        image: Image.asset('asset/alarm.png'),
        currentPage: 2,
        pageCount: 4),
    OnboardingPage(
        title: 'Get Started',
        description: "Let's Go",
        image: Image.asset('asset/happy.png'),
        currentPage: 3,
        pageCount: 4),
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
              }),
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
                            duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue, foregroundColor: Colors.white),
                      child: const Text('Previous'),
                    ),
                  const Spacer(),
                  if (_currentPage != _pages.length - 1)
                    ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue, foregroundColor: Colors.white),
                      child: const Text('Next'),
                    ),
                  if (_currentPage == _pages.length - 1)
                    ElevatedButton(
                      onPressed: widget.onDone,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue, foregroundColor: Colors.white),
                      child: const Text('Get Started'),
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
