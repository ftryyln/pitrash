import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/history/history_controller.dart';
import 'package:final_project/ui/history/detail/history_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(init: HistoryController(),builder: (controller) {
          return Scaffold(
                backgroundColor: whiteColor,
                appBar: AppBar(
                      title: Text("Riwayat",
                          style: title),
                      centerTitle: true,
                ),
                body: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                  Text("Pembayaran Tagihan Anda",
                                      style: heading1.copyWith(
                                          color: greyColor,
                                          fontWeight: bold)),
                                  SizedBox(
                                        height: 25,
                                  ),
                                  GestureDetector(
                                        onTap: () {
                                              Get.offAll(HistoryDetailScreen());
                                        },
                                        child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                    Text("November 2022",
                                                        style: body.copyWith(
                                                            color: blackColor,
                                                            fontWeight: medium)),
                                                    Container(
                                                          child: Row(
                                                                children: [
                                                                      Text("Rp 15.000",
                                                                          style: body.copyWith(
                                                                              color: blackColor,
                                                                              fontWeight: medium)),
                                                                      Icon(Icons.arrow_forward_ios_rounded,
                                                                            color: primaryColor, size: 14,)
                                                                ],
                                                          ),
                                                    ),
                                              ],
                                        ),
                                  ),
                                  SizedBox(
                                        height: 15,
                                  ),
                                  Divider(height: 1, color: greyColor.withOpacity(0.5), thickness: 1),
                                  SizedBox(
                                        height: 15,
                                  )
                            ],
                      ),
                ),
          );
    });
  }
}
