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
                CupertinoSlidingSegmentedControl<int>(
                  backgroundColor: CupertinoColors.white,
                  thumbColor: primaryColor,
                  padding: const EdgeInsets.all(20),
                  groupValue: controller.groupValue,
                  children: {
                    0: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text("Pickup Schedule", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    1: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text("Payment", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  },
                  onValueChanged: (value) {
                    controller.groupValue = value!;
                    controller.update();
                  },
                ),
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
                                  Text(item?.time ?? "Hari Ini",
                                      style: tiny.copyWith(
                                          color: greyColor, fontWeight: medium)),
                                  Text(item?.notification ?? "Pickup Hari Ini",
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
