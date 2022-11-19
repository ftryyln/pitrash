import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/bottomappbar/bottomnavbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(
        init: BottomNavBarController(),
        builder: (controller) {
          return Scaffold(
            body: controller.screen.elementAt(controller.indexHalaman.value),
            bottomNavigationBar: CustomNavigationBar(
              currentIndex: controller.indexHalaman.value,
              iconSize: 30.0,
              selectedColor: secondaryColor,
              unSelectedColor: whiteColor,
              backgroundColor: primaryColor,
              elevation: 0,
              onTap: (index) {
                controller.indexHalaman.value = index;
                controller.update();
              },
              items: [
                CustomNavigationBarItem(
                    icon: Icon(Icons.home_rounded,
                        shadows: [Shadow(color: whiteColor, blurRadius: 5)]),
                    selectedIcon: Container(
                        width: 50,
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(Icons.home_rounded, shadows: [
                          Shadow(color: secondaryColor, blurRadius: 5)
                        ])),
                    title: Text("Beranda",
                        style: body.copyWith(
                            color: whiteColor, fontWeight: bold))),
                CustomNavigationBarItem(
                  icon: Icon(Icons.history_rounded,
                      shadows: [Shadow(color: darkColor, blurRadius: 5)]),
                  selectedIcon: Container(
                      width: 50,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.history_rounded, shadows: [
                        Shadow(color: secondaryColor, blurRadius: 5)
                      ])),
                  title: Text("Riwayat",
                      style:
                          body.copyWith(color: whiteColor, fontWeight: bold)),
                ),
                CustomNavigationBarItem(
                  icon: Icon(Icons.person_rounded,
                      shadows: [Shadow(color: darkColor, blurRadius: 5)]),
                  selectedIcon: Container(
                      width: 50,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.history_rounded, shadows: [
                        Shadow(color: secondaryColor, blurRadius: 5)
                      ])),
                  title: Text("Profil",
                      style:
                          body.copyWith(color: whiteColor, fontWeight: bold)),
                ),
              ],
            ),
          );
        });
  }
}
