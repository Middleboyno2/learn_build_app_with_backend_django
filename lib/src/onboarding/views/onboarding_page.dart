import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shoes_store/common/utils/kcolors.dart';
import 'package:shoes_store/src/onboarding/controllers/onboarding_notifier.dart';
import 'package:shoes_store/src/onboarding/widgets/onboarding_page1.dart';
import 'package:shoes_store/src/onboarding/widgets/onboarding_page2.dart';
import 'package:shoes_store/src/onboarding/widgets/welcome_screen.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage: context.read<OnboardingNotifier>().selectedPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (page) {
              context.read<OnboardingNotifier>().setSelectedPage(page);
            },
            children: const [
              OnboardingPage1(),
              OnboardingPage2(),
              WelcomeScreen()
            ],
          ),
          Align(
            alignment: Alignment(0, 0.9),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              width: ScreenUtil().screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  context.watch<OnboardingNotifier>().selectedPage == 0
                      ?
                      // true
                      const SizedBox(width: 30)
                      :
                      //false
                      GestureDetector(
                          onTap: () {
                            _pageController.previousPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: const Icon(AntDesign.leftcircleo,
                              color: Kolors.kPrimary, size: 30),
                        ),
                  SizedBox(
                    width: ScreenUtil().screenWidth * 0.7,
                    height: 50.h,
                    child: PageViewDotIndicator(
                      currentItem:
                          context.watch<OnboardingNotifier>().selectedPage,
                      count: 3,
                      unselectedColor: Kolors.kGold,
                      selectedColor: Kolors.kPrimary,
                      duration: const Duration(milliseconds: 300),
                      onItemClicked: (index) {
                        _pageController.animateToPage(index,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                    ),
                  ),
                  context.watch<OnboardingNotifier>().selectedPage == 2
                      ?
                      // true
                      const SizedBox(width: 30)
                      : GestureDetector(
                          onTap: () {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child: const Icon(AntDesign.rightcircleo,
                              color: Kolors.kPrimary, size: 30),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
