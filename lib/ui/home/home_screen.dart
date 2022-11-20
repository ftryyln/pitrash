import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/education/detail/education_detail_screen.dart';
import 'package:final_project/ui/education/education_screen.dart';
import 'package:final_project/ui/home/home_controller.dart';
import 'package:final_project/ui/payment/payment_screen.dart';
import 'package:final_project/ui/schedule/schedule_screen.dart';
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
            body: RefreshIndicator(
              onRefresh: () async {
                controller.update();
              },
              child: SingleChildScrollView(
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
                        padding:
                        const EdgeInsets.only(
                            left: 20, right: 20, top: 30, bottom: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: darkColor, width: 3),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  controller.imageProfile))),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      controller.name.capitalize
                                          ?.split(" ")
                                          .first ?? "-",
                                      style: title,
                                      maxLines: 1,
                                      overflow: TextOverflow.visible,
                                    )
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () =>
                                  {
                                    Get.to(() => const NotificationScreen())
                                  },
                                  child: SvgPicture.asset(
                                      "assets/vector/icon_notif.svg"),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () =>
                              {Get.to(() => const PaymentScreen())},
                              child: Card(
                                elevation: 5,
                                shadowColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
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
                                                    color: greyColor,
                                                    fontWeight: bold)),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 10),
                                        child: Text("Rp 15.000",
                                            style: title.copyWith(
                                                color: blackColor,
                                                fontWeight: bold)),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
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
                                                style: body.copyWith(
                                                    fontWeight: bold)),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text("01 Desember 2022",
                                                style: body.copyWith(
                                                    fontWeight: bold)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Card(
                                  elevation: 5,
                                  shadowColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Container(
                                    height: 180,
                                    width: 170,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    child: Container(
                                      height: 160,
                                      width: 150,
                                      padding: EdgeInsets.all(10),
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
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () =>
                                  {Get.to(() => const ScheduleScreen())},
                                  child: Card(
                                    elevation: 5,
                                    shadowColor: primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    child: Container(
                                      height: 180,
                                      width: 170,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      child: Container(
                                        height: 160,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: whiteColor,
                                            borderRadius:
                                            BorderRadius.circular(20)),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.calendar_month,
                                                color: primaryColor, size: 50),
                                            Text("Jadwal",
                                                style: heading.copyWith(
                                                    color: primaryColor,
                                                    fontSize: 18,
                                                    fontWeight: bold)),
                                            Text("Pengambilan",
                                                style: heading.copyWith(
                                                    color: primaryColor,
                                                    fontSize: 18,
                                                    fontWeight: bold)),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  right: 15,
                                                  left: 15,
                                                  top: 5,
                                                  bottom: 5),
                                              width: 130,
                                              height: 33,
                                              decoration: BoxDecoration(
                                                  color: primaryColor,
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      20)),
                                              child: Center(
                                                child: Text("Belum Diambil",
                                                    style: tiny.copyWith(
                                                        color: whiteColor,
                                                        fontWeight: bold)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ]),
                    Column(
                      children: [
                        CarouselSlider(
                          items: controller.image,
                          options: CarouselOptions(
                              viewportFraction: 0.9,
                              //autoPlayCurve: Curves.bounceOut,
                              height: 200,
                              autoPlay: true,
                              onPageChanged: (index, reason) {
                                controller.currentIndex.value = index;
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Pengetahuan",
                                      style: heading1.copyWith(
                                          color: blackColor, fontWeight: bold)),
                                  GestureDetector(
                                    onTap: () => Get.to(EducationScreen()),
                                    child: Text("Lihat Semua",
                                        style: heading1.copyWith(
                                            color: primaryColor,
                                            fontWeight: bold)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: controller.educationModel?.data
                                      ?.map((e) =>
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        children: [
                                          GestureDetector(
                                            onTap: () => Get.to(() => const EducationDetailScreen()),
                                            child: Container(
                                              width: 180,
                                              height: 160,
                                              child: Column(
                                                children: [
                                                  Card(
                                                    elevation: 5,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius
                                                            .only(
                                                            topLeft:
                                                            Radius.circular(25),
                                                            topRight:
                                                            Radius.circular(25),
                                                            bottomLeft:
                                                            Radius.circular(10),
                                                            bottomRight:
                                                            Radius.circular(
                                                                10))),
                                                    child: Container(
                                                      height: 30,
                                                      width: 180,
                                                      padding: EdgeInsets.only(
                                                          right: 13,
                                                          left: 13,
                                                          top: 7,
                                                          bottom: 7),
                                                      decoration: BoxDecoration(
                                                          color: primaryColor,
                                                          borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(25),
                                                              topRight:
                                                              Radius.circular(
                                                                  25),
                                                              bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                              bottomRight:
                                                              Radius.circular(
                                                                  10))),
                                                      child: Center(
                                                        child: Text(
                                                            e.title ?? "-",
                                                            // "Pengelolaan Sampah",
                                                            style: tiny
                                                                .copyWith(
                                                                color: whiteColor,
                                                                fontWeight: medium),
                                                            maxLines: 1,
                                                            overflow:
                                                            TextOverflow
                                                                .visible),
                                                      ),
                                                    ),
                                                  ),
                                                  Card(
                                                    elevation: 5,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius
                                                            .only(
                                                            topLeft:
                                                            Radius.circular(10),
                                                            topRight:
                                                            Radius.circular(10),
                                                            bottomLeft:
                                                            Radius.circular(25),
                                                            bottomRight:
                                                            Radius.circular(
                                                                25))),
                                                    child: Container(
                                                      padding: EdgeInsets.all(
                                                          8),
                                                      height: 110,
                                                      width: 180,
                                                      decoration: BoxDecoration(
                                                          color: primaryColor,
                                                          borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight:
                                                              Radius.circular(
                                                                  10),
                                                              bottomLeft:
                                                              Radius.circular(
                                                                  25),
                                                              bottomRight:
                                                              Radius.circular(
                                                                  25))),
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius
                                                            .only(
                                                            topLeft:
                                                            Radius.circular(10),
                                                            topRight:
                                                            Radius.circular(10),
                                                            bottomLeft:
                                                            Radius.circular(25),
                                                            bottomRight:
                                                            Radius.circular(
                                                                25)),
                                                        child: Image.network(
                                                          e.image ?? "https://",
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )).toList() ?? [],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
