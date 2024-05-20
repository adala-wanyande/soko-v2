// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:soko_v2/widgets/page_indicator.dart';
import 'package:soko_v2/widgets/get_started_section.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/verification/get_started_bg_1.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: [
                buildPage(
                  context,
                  'assets/verification/get_started_1.png',
                  'Earn discounts by completing challenges',
                ),
                buildPage(
                  context,
                  'assets/verification/get_started_2.png',
                  'Complete challenges based on your interests',
                ),
                buildPage(
                  context,
                  'assets/verification/get_started_3.png',
                  'Get items from your favourite stores at throwaway prices',
                  isLastPage: true,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: buildPageIndicator(_currentPage),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
