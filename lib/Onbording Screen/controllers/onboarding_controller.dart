import 'package:flutter/material.dart';
import 'package:mgxchange/Onbording%20Screen/models/onboarding_info.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:mgxchange/Screens/Auth/login.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      //go to home page
      Get.offNamedUntil('/login', (route) => false);

    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/sell.png', 'Post your Selling Items',
        'In this app We Sell Product and Take Payment or Loan'),
    OnboardingInfo('assets/done.png', 'Collaborating',
        'Meet the Terms and Conditions'),
    OnboardingInfo('assets/loan.png', 'Take Loan',
        'After Approving Selling Items take Loan')
  ];
}
