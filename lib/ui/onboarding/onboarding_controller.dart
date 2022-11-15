import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OnboardingController extends GetxController {
  List<Widget> image = [
    Image.asset('assets/image/onboarding/onboarding1.png', fit: BoxFit.cover),
    Image.asset('assets/image/onboarding/onboarding2.png', fit: BoxFit.cover),
    Image.asset('assets/image/onboarding/onboarding3.png', fit: BoxFit.cover),
  ];

  var currentIndex = 0.obs;
  CarouselController carouselController = CarouselController();

  @override
  void onInit(){
    super.onInit();
    image;
    print(currentIndex);
    update();
  }
}