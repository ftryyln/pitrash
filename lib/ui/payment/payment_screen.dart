import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/payment/detail/detail_payment_screen.dart';
import 'package:final_project/ui/payment/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:lottie/lottie.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting("id");
    Get.put<PaymentController>(PaymentController());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
        builder: (controller) {
          if (controller.state == PaymentViewState.loading) {
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
            appBar: AppBar(
              backgroundColor: primaryColor,
              elevation: 0,
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset("assets/vector/back.svg",
                      color: whiteColor),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  SvgPicture.asset("assets/vector/bgappbar.svg",
                      fit: BoxFit.cover),
                  SizedBox(
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: SvgPicture.asset("assets/vector/payment.svg",
                              width: 300, height: 300),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 30),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Tagihan Anda",
                                      style:
                                          title.copyWith(color: primaryColor)),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        right: 7, left: 7, top: 5, bottom: 5),
                                    width: 125,
                                    decoration: BoxDecoration(
                                        color: controller.transactionModel?.data
                                                    ?.waiting?.isNotEmpty ==
                                                true
                                            ? greyColor
                                            : controller.transactionModel?.data
                                                        ?.latest?.last.status
                                                        ?.toLowerCase() ==
                                                    "belum dibayar"
                                                ? redColor
                                                : primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
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
                                          textAlign: TextAlign.center,
                                          style: tiny.copyWith(
                                              color: whiteColor,
                                              fontWeight: bold)),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text("Periode Tagihan",
                                          style: tiny.copyWith(
                                              color: greyColor,
                                              fontWeight: extralight)),
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
                                                  "Thu, Dec 1, 2022")),
                                          style: tiny.copyWith(
                                              color: blackColor,
                                              fontWeight: bold)),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("Batas Pembayaran",
                                          style: tiny.copyWith(
                                              color: greyColor,
                                              fontWeight: extralight)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          controller.toDateFormat.format(
                                              controller.formatter.parse(
                                                  controller
                                                          .schedulePaymentModel
                                                          ?.data
                                                          ?.incoming
                                                          ?.first
                                                          .dueDate ??
                                                      "Sun, Dec 25, 2022")),
                                          style: tiny.copyWith(
                                              color: blackColor,
                                              fontWeight: bold)),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                width: Get.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("Total Tagihan",
                                        style: tiny.copyWith(
                                            color: greyColor,
                                            fontWeight: extralight)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        controller.numberFormat.format(
                                            int.parse(controller
                                                    .transactionModel
                                                    ?.data
                                                    ?.latest
                                                    ?.first
                                                    .price
                                                    ?.split('.')
                                                    .first ??
                                                "0")),
                                        style: title.copyWith(
                                            color: blackColor,
                                            fontWeight: bold)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // controller.whatsAppOpen();
                                  print(
                                      "bayar ${controller.transactionModel?.data?.latest?.last.status?.toLowerCase()}");
                                  if (controller.transactionModel?.data?.latest
                                          ?.last.status
                                          ?.toLowerCase() ==
                                      "belum dibayar") {
                                    Get.to(() => const DetailPaymentScreen());
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "Tagihan anda sudah dibayar!");
                                  }
                                },
                                child: Card(
                                  elevation: 5,
                                  color: primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: controller.transactionModel?.data
                                                    ?.latest?.last.status
                                                    ?.toLowerCase() !=
                                                "belum dibayar"
                                            ? primaryColor
                                            : greyColor,
                                        gradient: LinearGradient(
                                            colors: [
                                              primaryColor,
                                              darkColor.withOpacity(0.5)
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                        child: Text(
                                      "Bayar",
                                      style:
                                          body.copyWith(fontWeight: semiBold),
                                    )),
                                  ),
                                ),
                              ),
                            ],
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

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    var controller = Get.find<PaymentController>();
    if (state == AppLifecycleState.resumed) {
      Future.wait(
          [controller.getTransaction(), controller.getSchedulePayment()]);
    }
    controller.update();
  }
}
