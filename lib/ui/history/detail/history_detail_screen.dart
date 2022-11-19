import 'package:dotted_border/dotted_border.dart';
import 'package:final_project/const/color.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/history/detail/history_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HistoryDetailScreen extends StatelessWidget {
  const HistoryDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryDetailController>(
        init: HistoryDetailController(),
        builder: (controller) {
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
              child: SizedBox(
                height: 1006,
                child: Stack(
                  children: [
                    SvgPicture.asset("assets/vector/bgappbar.svg",
                        fit: BoxFit.cover),
                    Container(
                      width: Get.width,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                                "assets/image/historydetail/transaction.png",
                                fit: BoxFit.contain),
                            const SizedBox(
                              height: 20,
                            ),
                            Text("Pembayaran Berhasil",
                                style: title.copyWith(color: primaryColor)),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 524,
                              width: 300,
                              child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(20),
                                  dashPattern: [10, 10],
                                  color: primaryColor,
                                  strokeWidth: 2,
                                  padding: EdgeInsets.all(10),
                                  child: Card(
                                    color: primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Image.network(
                                          controller.image,
                                          fit: BoxFit.contain),
                                    ),
                                  )),
                            ),
                            SvgPicture.asset("assets/vector/bgbottombar.svg",
                                fit: BoxFit.cover),
                          ]),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
