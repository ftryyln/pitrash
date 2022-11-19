import 'package:dotted_border/dotted_border.dart';
import 'package:final_project/const/color.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/history/detail/history_detail_controller.dart';
import 'package:final_project/ui/history/history_screen.dart';
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
            appBar:
                AppBar(backgroundColor: primaryColor, elevation: 0, actions: [
              GestureDetector(
                onTap: () {
                  Get.offAll(HistoryScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset("assets/vector/icon_close.svg",
                      color: whiteColor),
                ),
              ),
            ]),
            body: SingleChildScrollView(
              child: SizedBox(
                height: 996,
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
                            SizedBox(
                              height: 20,
                            ),
                            Text("Pembayaran Berhasil",
                                style: title.copyWith(color: primaryColor)),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 300,
                              child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(20),
                                  dashPattern: [10, 10],
                                  color: primaryColor,
                                  strokeWidth: 2,
                                  child: Card(
                                    color: Colors.amber,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                          "assets/image/historydetail/ss_transaction.jpg",
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
