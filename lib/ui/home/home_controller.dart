import 'package:carousel_slider/carousel_controller.dart';
import 'package:final_project/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  List<Widget> image = [
    Image.asset('assets/image/home/poster.png'),
    Image.asset('assets/image/home/poster.png'),
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