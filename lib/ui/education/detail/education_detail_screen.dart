import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/education/detail/education_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EducationDetailScreen extends StatelessWidget {
  const EducationDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EducationDetailController>(
        init: EducationDetailController(),
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
              title: Text(controller.data.userId?.name?.capitalize ?? "",
                  style: title, maxLines: 1, overflow: TextOverflow.visible),
              centerTitle: true,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(children: [
                        Image.network(
                          controller.data.image ?? "https://",
                          height: Get.height - 131,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          decoration: BoxDecoration(
                              color: blackColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(controller.data.title ?? "No Title",
                                style: titleArticle, textAlign: TextAlign.center),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet<void>(
                                backgroundColor: const Color(0x00FFFFFF),
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    padding: const EdgeInsets.all(15),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            topLeft: Radius.circular(20)),
                                        color: primaryColor),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/vector/line.svg"),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                            width: Get.width*0.7,
                                            height: 20,
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20),
                                            decoration: BoxDecoration(
                                                color: whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Center(
                                                child: Text(
                                                    DateFormat(
                                                            "dd MMMM yyyy, HH:mm")
                                                        .format(DateFormat(
                                                                "yyyy-MM-ddTHH:mm:ss.000000Z")
                                                            .parse(controller
                                                                .data
                                                                .createdAt!)),
                                                    style: tiny.copyWith(
                                                        color: secondaryColor,
                                                        fontWeight: bold)))),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: Text(
                                                controller.data.content ??
                                                    "No Description",
                                                style: body,
                                                textAlign: TextAlign.justify),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text("Lihat Deskripsi",
                                    style: titleArticle,
                                    maxLines: 2,
                                    overflow: TextOverflow.visible),
                              ),
                            ),
                          ),
                        ),
                      ])),
                ),
              ],
            ),
            // bottomSheet:
          );
        });
  }
}
