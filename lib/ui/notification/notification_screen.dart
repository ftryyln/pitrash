import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/home/home_screen.dart';
import 'package:final_project/ui/notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
        init: NotificationController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: whiteColor,
            appBar: AppBar(
              backgroundColor: primaryColor,
              elevation: 0,
              title: Text("Pemberitahuan",
                  style: title.copyWith(fontWeight: semiBold)),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  Get.offAll(HomeScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset("assets/vector/back.svg",
                      color: whiteColor),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      children: [
                        SizedBox(
                          width:50,
                            height: 50,
                            child: SvgPicture.asset(
                                "assets/vector/schedulenotif.svg")),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("04 Desember 2022, 07:00 AM ",
                                  style: tiny.copyWith(
                                      color: greyColor, fontWeight: medium)),
                              Text("Sampah akan diambil",
                                  style: body.copyWith(
                                      color: primaryColor,
                                      fontWeight: semiBold),
                                  maxLines: 1,
                                  overflow: TextOverflow.visible),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
