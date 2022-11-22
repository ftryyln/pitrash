import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/history/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
        init: HistoryController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: whiteColor,
            appBar: AppBar(
              elevation: 0,
              title: Text("Riwayat", style: title),
              centerTitle: true,
            ),
            body: controller.historyModel != null
                ? Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pembayaran Tagihan Anda",
                      style: heading1.copyWith(
                          color: greyColor, fontWeight: bold)),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        controller.update();
                      },
                      child: ListView.builder(
                          itemCount:
                          controller.historyModel?.data?.history?.length ??
                              0,
                          itemBuilder: (context, index) =>
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          controller.toFormat.format(
                                              controller.formatter
                                                  .parse(controller
                                                  .historyModel?.data?.history?[index].updatedAt ?? "2022-11-22T13:43:23.000000Z")),
                                          style: body.copyWith(
                                              color: blackColor,
                                              fontWeight: medium)),
                                      Row(
                                        children: [
                                          Text(
                                              controller.numberFormat
                                                  .format(double.parse(
                                                  controller
                                                      .historyModel
                                                      ?.data!.latest
                                                      ?.price ??
                                                      "0")),
                                              style: body.copyWith(
                                                  color: blackColor,
                                                  fontWeight:
                                                  medium)),
                                          const Icon(
                                            Icons
                                                .arrow_forward_ios_rounded,
                                            color: primaryColor,
                                            size: 14,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Divider(
                                      height: 1,
                                      color: greyColor.withOpacity(0.5),
                                      thickness: 1),
                                ],
                              )),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            )
                : Center(
              child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Lottie.asset("assets/lottie/loading.json")),
            ),
          );
        });
  }
}
