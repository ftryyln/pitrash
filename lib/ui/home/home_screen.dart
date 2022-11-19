import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/education/education_screen.dart';
import 'package:final_project/ui/home/home_controller.dart';
import 'package:final_project/ui/payment/payment_screen.dart';
import 'package:final_project/ui/notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: whiteColor,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    SizedBox(
                      height: 225,
                      width: 300,
                    ),
                    SvgPicture.asset(
                      "assets/vector/bgappbarhome.svg",
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/vector/icon_person.svg",
                                    fit: BoxFit.cover),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Fitry Yuliani",
                                  style: heading.copyWith(fontWeight: bold),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: GestureDetector(
                              onTap: () => {Get.offAll(NotificationScreen())},
                              child: SvgPicture.asset(
                                  "assets/vector/icon_notif.svg"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 8,
                      left: 8,
                      child: GestureDetector(
                        onTap: () => {
                          Get.offAll(PaymentScreen())
                        },
                        child: Card(
                          elevation: 5,
                          shadowColor: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total Tagihan Anda",
                                          style: heading1.copyWith(
                                              color: greyColor, fontWeight: bold)),
                                      Container(
                                        padding: EdgeInsets.only(
                                            right: 15, left: 15, top: 5, bottom: 5),
                                        width: 80,
                                        height: 33,
                                        decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Center(
                                          child: Text("Status",
                                              style:
                                                  body.copyWith(fontWeight: bold)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text("Rp 15.000",
                                      style: title.copyWith(
                                          color: blackColor, fontWeight: bold)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  height: 40,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    color: primaryColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Tagihan Berikutnya",
                                          style: body.copyWith(fontWeight: bold)),
                                      Text("01 Desember 2022",
                                          style: body.copyWith(fontWeight: bold)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 5,
                          shadowColor: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            height: 170,
                            width: 400,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 140,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius:
                                          BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      Text("04",
                                          style: title.copyWith(
                                              color: secondaryColor,
                                              fontSize: 60,
                                              fontWeight: bold)),
                                      Text("Desember",
                                          style: heading.copyWith(
                                              color: primaryColor,
                                              fontSize: 16,
                                              fontWeight: medium)),
                                      Text("2022",
                                          style: title.copyWith(
                                              color: primaryColor,
                                              fontSize: 30,
                                              fontWeight: bold)),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.calendar_month,
                                        color: whiteColor, size: 100),
                                    Text("Jadwal Pengambilan",
                                        style: heading.copyWith(
                                            fontSize: 18, fontWeight: bold)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: CarouselSlider(
                            items: controller.image,
                            options: CarouselOptions(
                                viewportFraction: 1,
                                autoPlayCurve: Curves.bounceOut,
                                height: 200,
                                autoPlay: true,
                                onPageChanged: (index, reason) {
                                  controller.currentIndex.value = index;
                                }),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Pengetahuan",
                                style: heading1.copyWith(
                                    color: blackColor, fontWeight: bold)),
                            GestureDetector(
                              onTap: () => Get.to(EducationScreen()),
                              child: Text("Lihat Semua",
                                  style: heading1.copyWith(
                                      color: primaryColor, fontWeight: bold)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Container(
                            height: 30,
                            width: 150,
                            padding: EdgeInsets.only(
                                right: 13, left: 13, top: 7, bottom: 7),
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: Center(
                              child: Text("Pengelolaan Sampah",
                                  style: tiny.copyWith(
                                      color: whiteColor, fontWeight: medium),
                                  maxLines: 1,
                                  overflow: TextOverflow.visible),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25))),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            height: 90,
                            width: 150,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25))),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25)),
                              child: Image.asset(
                                "assets/image/image.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
