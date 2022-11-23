import 'package:dotted_border/dotted_border.dart';
import 'package:final_project/ui/payment/detail/detail_payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:slide_countdown/slide_countdown.dart';

class DetailPaymentScreen extends StatelessWidget {
  const DetailPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailPaymentController>(
        init: DetailPaymentController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: Text("Upload Bukti Pembayaran"),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        height: 100,
                        width: Get.width,
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.black)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Batas Akhir Pembayaran"),
                                  // Text("Due Date Di Schedule engke di consume")
                                ],
                              ),
                              SlideCountdown(
                                duration: DateFormat("EEE, MMM dd, yyyy")
                                    .parse("Fri, Nov 30, 2022")
                                    .difference(DateTime.now()),
                              )
                            ])),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DottedBorder(
                          child: Container(
                        alignment: Alignment.center,
                        height: 300,
                        width: Get.width,
                        child: controller.gettedFile == null ? InkWell(
                            onTap: () => controller.getSinglePhoto(),
                            child: const Text("Upload Foto Disini")) : Image.file(controller.gettedFile!),
                      )),
                    ),
                  ],
                ),
              ),
            ));
  }
}
