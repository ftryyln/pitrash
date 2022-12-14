import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/notification/notification_controller.dart';
import 'package:flutter/cupertino.dart';
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
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset("assets/vector/back.svg",
                      color: whiteColor),
                ),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(primary: false, shrinkWrap: true, itemCount: controller.listNotifModel?.data?.length ?? 0, itemBuilder: (context, index) {
                    var item = controller.listNotifModel?.data?[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          children: [
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: SvgPicture.asset(
                                    "assets/vector/schedulenotif.svg")),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item?.time ?? "-",
                                      style: tiny.copyWith(
                                          color: greyColor, fontWeight: medium)),
                                  Text(item?.notification ?? "-",
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
                      ),
                    );
                  }),
                )
              ],
            ),
          );
        });
  }
}
