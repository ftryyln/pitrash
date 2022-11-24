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
import 'package:lottie/lottie.dart';
import 'package:intl/date_symbol_data_local.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {


  @override
  void initState() {
    super.initState();
    initializeDateFormatting("id");
    Get.put<HomeController>(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        // init: HomeController(),
        builder: (controller) {
          if (controller.state == HomeViewState.loading) {
            return Scaffold(
              body: Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Lottie.asset("assets/lottie/loading.json"))),
            );
          }
          return Scaffold(
            backgroundColor: whiteColor,
            body: RefreshIndicator(
              onRefresh: () async {
                Future.wait([
                  controller.getCarousel(),
                  controller.getProfile(),
                  controller.getEducation(),
                  controller.getTransaction(),
                  controller.getSchedulePickup(),
                  controller.getSchedulePayment()
                ]);
                controller.update();
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      const SizedBox(
                        height: 225,
                        width: 300,
                      ),
                      SvgPicture.asset(
                        "assets/vector/bgappbarhome.svg",
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 48, bottom: 20),
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
                                            // onError: (object, stacktrace) => SvgPicture.asset('assets/vector/icon_person.svg'),
                                            onError: (object, stacktrace) =>
                                                Image.asset("assets/vector/icon_person.png"),
                                            image: controller.imageProfile.isNotEmpty ? NetworkImage(
                                                controller.imageProfile) : const AssetImage("assets/vector/icon_person.png") as ImageProvider<Object>),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      controller.name.capitalize
                                              ?.split(" ")
                                              .first ??
                                          "-",
                                      style: title,
                                      maxLines: 1,
                                      overflow: TextOverflow.visible,
                                    )
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () => {
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
                            controller.transactionModel != null
                                ? GestureDetector(
                                    onTap: () =>
                                        {Get.to(() => const PaymentScreen())},
                                    child: Card(
                                      elevation: 5,
                                      shadowColor: primaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: SizedBox(
                                        width: Get.width,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, left: 10, right: 10),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("Total Tagihan Anda",
                                                      style: heading1.copyWith(
                                                          color: greyColor,
                                                          fontWeight: bold)),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 7,
                                                            left: 7,
                                                            top: 5,
                                                            bottom: 5),
                                                    width: 125,
                                                    // height: 33,
                                                    decoration: BoxDecoration(
                                                        color: controller
                                                                    .transactionModel
                                                                    ?.data
                                                                    ?.waiting
                                                                    ?.isNotEmpty ==
                                                                true
                                                            ? greyColor
                                                            : controller
                                                                        .transactionModel
                                                                        ?.data
                                                                        ?.latest !=
                                                                    null
                                                                ? controller
                                                                            .transactionModel
                                                                            ?.data
                                                                            ?.latest
                                                                            ?.last
                                                                            .status
                                                                            ?.toLowerCase() ==
                                                                        "belum dibayar"
                                                                    ? redColor
                                                                    : primaryColor
                                                                : redColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Center(
                                                      child: Text(

                                                          controller.transactionModel?.data
                                                              ?.waiting
                                                              ?.isNotEmpty ==
                                                              true &&
                                                              controller.transactionModel?.data?.waiting !=
                                                                  null
                                                              ? controller
                                                              .transactionModel
                                                              ?.data
                                                              ?.waiting
                                                              ?.last
                                                              .status ??
                                                              "-"
                                                              : controller
                                                              .transactionModel
                                                              ?.data
                                                              ?.latest
                                                              ?.isNotEmpty ==
                                                              true &&
                                                              controller
                                                                  .transactionModel
                                                                  ?.data
                                                                  ?.latest !=
                                                                  null
                                                              ? controller
                                                              .transactionModel
                                                              ?.data
                                                              ?.latest
                                                              ?.last
                                                              .status ??
                                                              "-"
                                                              : "-",
                                                              textAlign: TextAlign
                                                                  .center,
                                                              style: tiny.copyWith(
                                                                  color: whiteColor,
                                                                  fontWeight: bold))
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                  controller.numberFormat
                                                      .format(int.parse(
                                                          controller
                                                              .transactionModel!
                                                              .data!
                                                              .latest!
                                                              .last
                                                              .price!
                                                              .split('.')
                                                              .first)),
                                                  style: title.copyWith(
                                                      color: blackColor,
                                                      fontWeight: bold)),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              height: 40,
                                              width: 400,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(20),
                                                    bottomRight:
                                                        Radius.circular(20)),
                                                color: primaryColor,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("Tagihan Berikutnya",
                                                      style: body.copyWith(
                                                          fontWeight: bold)),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                      controller.toFormat.format(controller
                                                          .formatter
                                                          .parse(controller
                                                                  .schedulePaymentModel
                                                                  ?.data
                                                                  ?.incoming
                                                                  ?.first
                                                                  .beginDate ??
                                                              "Mon, Nov 28, 2022")),
                                                      style: body.copyWith(
                                                          fontWeight: bold)),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : const Center(
                                    child: CircularProgressIndicator.adaptive(),
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
                                    height: 190,
                                    width: 170,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Column(
                                        children: [
                                          Text(
                                              controller.toDayFormat.format(
                                                  controller.formatter.parse(
                                                      controller
                                                              .schedulePickupModel
                                                              ?.data
                                                              ?.incoming
                                                              ?.first
                                                              .beginDate ??
                                                          "Mon, Nov 28, 2022")),
                                              style: title.copyWith(
                                                  color: secondaryColor,
                                                  fontSize: 60,
                                                  fontWeight: bold)),
                                          Text(
                                              controller.toMonthFormat.format(
                                                  controller.formatter.parse(
                                                      controller
                                                              .schedulePickupModel
                                                              ?.data
                                                              ?.incoming
                                                              ?.first
                                                              .beginDate ??
                                                          "Mon, Nov 28, 2022")),
                                              style: heading.copyWith(
                                                  color: primaryColor,
                                                  fontSize: 16,
                                                  fontWeight: medium)),
                                          Text(
                                              controller.toYearFormat.format(
                                                  controller.formatter.parse(
                                                      controller
                                                              .schedulePickupModel
                                                              ?.data
                                                              ?.incoming
                                                              ?.first
                                                              .beginDate ??
                                                          "Mon, Nov 28, 2022")),
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
                                      height: 190,
                                      width: 170,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Icon(Icons.calendar_month,
                                                color: secondaryColor,
                                                size: 70),
                                            Text("Riwayat",
                                                style: heading.copyWith(
                                                    color: primaryColor,
                                                    fontSize: 20,
                                                    fontWeight: bold),
                                                textAlign: TextAlign.center),
                                            Text("Jadwal Pengambilan",
                                                style: heading.copyWith(
                                                    color: primaryColor,
                                                    fontSize: 10,
                                                    fontWeight: bold),
                                                textAlign: TextAlign.center),
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
                    controller.listCarousel.isNotEmpty == true
                        ? Column(
                            children: [
                              CarouselSlider.builder(
                                itemBuilder: (context, index, realIndex) {
                                  return AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: Image.network(
                                      controller.listCarousel[index].image ??
                                          "https://",
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(
                                            color: secondaryColor,
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                                options: CarouselOptions(
                                    viewportFraction: 0.9,
                                    height: 200,
                                    autoPlay: true,
                                    onPageChanged: (index, reason) {
                                      controller.currentIndex.value = index;
                                    }),
                                itemCount: controller.listCarousel.length,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 20, left: 20, top: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Pengetahuan",
                                            style: heading1.copyWith(
                                                color: blackColor,
                                                fontWeight: bold)),
                                        GestureDetector(
                                          onTap: () =>
                                              Get.to(const EducationScreen()),
                                          child: Text("Lihat Semua",
                                              style: heading1.copyWith(
                                                  color: primaryColor,
                                                  fontWeight: bold)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: controller.educationModel?.data
                                          ?.map((e) => Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8,
                                                    right: 8,
                                                    top: 8,
                                                    bottom: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () => Get.to(
                                                          () =>
                                                              const EducationDetailScreen(),
                                                          arguments: e),
                                                      child: SizedBox(
                                                        width: 180,
                                                        height: 180,
                                                        child: Column(
                                                          children: [
                                                            Card(
                                                              elevation: 5,
                                                              shadowColor:
                                                                  primaryColor,
                                                              shape: const RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft:
                                                                          Radius.circular(
                                                                              25),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              25),
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              10),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              10))),
                                                              child: Container(
                                                                height: 30,
                                                                width: 180,
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(7),
                                                                decoration: const BoxDecoration(
                                                                    color:
                                                                        primaryColor,
                                                                    borderRadius: BorderRadius.only(
                                                                        topLeft:
                                                                            Radius.circular(
                                                                                25),
                                                                        topRight:
                                                                            Radius.circular(
                                                                                25),
                                                                        bottomLeft:
                                                                            Radius.circular(
                                                                                10),
                                                                        bottomRight:
                                                                            Radius.circular(10))),
                                                                child: Center(
                                                                  child: Text(
                                                                      e.title ??
                                                                          "-",
                                                                      style: tiny.copyWith(
                                                                          color:
                                                                              whiteColor,
                                                                          fontWeight:
                                                                              medium),
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .visible,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center),
                                                                ),
                                                              ),
                                                            ),
                                                            Card(
                                                              elevation: 5,
                                                              shadowColor:
                                                                  primaryColor,
                                                              shape: const RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft:
                                                                          Radius.circular(
                                                                              10),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              10),
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              25),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              25))),
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(8),
                                                                height: 130,
                                                                width: 180,
                                                                decoration: const BoxDecoration(
                                                                    color:
                                                                        primaryColor,
                                                                    borderRadius: BorderRadius.only(
                                                                        topLeft:
                                                                            Radius.circular(
                                                                                10),
                                                                        topRight:
                                                                            Radius.circular(
                                                                                10),
                                                                        bottomLeft:
                                                                            Radius.circular(
                                                                                25),
                                                                        bottomRight:
                                                                            Radius.circular(25))),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius: const BorderRadius
                                                                          .only(
                                                                      topLeft:
                                                                          Radius.circular(
                                                                              10),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              10),
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              25),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              25)),
                                                                  child: Image.network(
                                                                      e.image ??
                                                                          "https://",
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      loadingBuilder: (BuildContext context,
                                                                          Widget
                                                                              child,
                                                                          ImageChunkEvent?
                                                                              loadingProgress) {
                                                                    if (loadingProgress ==
                                                                        null) {
                                                                      return child;
                                                                    }
                                                                    return Center(
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        color:
                                                                            secondaryColor,
                                                                        value: loadingProgress.expectedTotalBytes !=
                                                                                null
                                                                            ? loadingProgress.cumulativeBytesLoaded /
                                                                                loadingProgress.expectedTotalBytes!
                                                                            : null,
                                                                      ),
                                                                    );
                                                                  }),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ))
                                          .toList() ??
                                      [],
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink()
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.resumed) {
      var controller = Get.find<HomeController>();
      Future.wait([
        controller.getCarousel(),
        controller.getProfile(),
        controller.getEducation(),
        controller.getTransaction(),
        controller.getSchedulePickup(),
        controller.getSchedulePayment()
      ]);
    }
  }
}
