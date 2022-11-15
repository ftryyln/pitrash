import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
        init: OnboardingController(),
        builder: (controller) {
          return Scaffold(
            body: Stack(
              children: [
                CarouselSlider(
                  items: controller.image,
                  options: CarouselOptions(
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                      height: Get.height,
                      onPageChanged: (index, reason) {
                        controller.currentIndex.value = index;
                      }),
                  carouselController: controller.carouselController,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: GestureDetector(
                                onTap: () => Get.to(LoginScreen()),
                                child: Text("Skip",
                                    style: heading.copyWith(fontWeight: regular)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Row(
                                children: [
                                  Container(
                                    width: 12,
                                    height: 12,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: controller.currentIndex == 0
                                            ? white
                                            : dark),
                                  ),
                                  Container(
                                    width: 12,
                                    height: 12,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: controller.currentIndex == 1
                                            ? white
                                            : dark),
                                  ),
                                  Container(
                                      width: 12,
                                      height: 12,
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: controller.currentIndex == 2
                                            ? white
                                            : dark,
                                      )),
                                ],
                              ),

                            ),
                            GestureDetector(
                              onTap: (){
                                controller.currentIndex++;
                                print(controller.currentIndex);
                                controller.currentIndex != 3
                                    ? controller.carouselController.nextPage()
                                    : Get.offAllNamed('/login');
                              },
                            child: Stack(
                              children: [
                                SvgPicture.asset("assets/vector/buttonnext.svg"),
                                Positioned(bottom: 30, top: 30, left: 26, right: 26,
                                    child: Text("Next", style: heading.copyWith(fontWeight: bold)))
                              ],
                            )),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
