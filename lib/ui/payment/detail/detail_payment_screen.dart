import 'package:dotted_border/dotted_border.dart';
import 'package:final_project/const/color.dart';
import 'package:final_project/ui/payment/detail/detail_payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../../../const/font_weight.dart';
import '../../../const/text_style.dart';

class DetailPaymentScreen extends StatelessWidget {
  const DetailPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailPaymentController>(
        init: DetailPaymentController(),
        builder: (controller) => Scaffold(
              backgroundColor: primaryColor,
              appBar: AppBar(
                backgroundColor: whiteColor,
                elevation: 0,
                title: Text("Upload Bukti Pembayaran",
                    style: heading.copyWith(
                        color: primaryColor, fontWeight: bold)),
                centerTitle: true,
                leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: SvgPicture.asset("assets/vector/back.svg"),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                        height: 80,
                        width: Get.width,
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Batas Akhir Pembayaran",
                                      style: tiny.copyWith(
                                          fontSize: 12,
                                          color: greyColor.withOpacity(0.6))),
                                  Text(
                                    controller.toDateFormat.format(
                                        controller.formatter.parse(controller
                                                .schedulePaymentModel
                                                ?.data
                                                ?.incoming
                                                ?.first
                                                .dueDate ??
                                            "Sun, Dec 25, 2022")),
                                    style: body.copyWith(
                                        color: blackColor, fontWeight: bold),
                                  )
                                ],
                              ),
                              SlideCountdown(
                                duration: DateFormat("EEE, MMM dd, yyyy")
                                    .parse("Fri, Nov 30, 2022")
                                    .difference(DateTime.now()),
                              )
                            ])),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(20),
                          dashPattern: const [10, 10],
                          color: whiteColor,
                          strokeWidth: 2,
                          padding: const EdgeInsets.all(10),
                          child: Card(
                            color: whiteColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              height: 500,
                              width: Get.width,
                              child: controller.gettedFile == null
                                  ? InkWell(
                                      onTap: () => controller.getSinglePhoto(),
                                      child: Text(
                                        "Upload Foto Disini",
                                        style: heading.copyWith(
                                            color: greyColor.withOpacity(0.6),
                                            fontWeight: bold),
                                      ))
                                  : Image.file(controller.gettedFile!),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.postUploadPayment();
                      },
                      child: Card(
                        elevation: 5,
                        color: whiteColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          width: Get.width * 0.8,
                          height: 40,
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                            "Kirim",
                            style: body.copyWith(
                                color: primaryColor, fontWeight: semiBold),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
