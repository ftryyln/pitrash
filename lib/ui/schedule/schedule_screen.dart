import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/schedule/schedule_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScheduleController>(
        init: ScheduleController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: primaryColor,
                elevation: 0,
                title: Text("Jadwal Pengambilan",
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
              body: controller.schedulePickupModel != null
                  ? Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: controller
                                  .schedulePickupModel?.data?.history?.length,
                              itemBuilder: (context, index) {
                                var item = controller
                                    .schedulePickupModel?.data?.history?[index];
                                return Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: primaryColor.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Row(children: [
                                        SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: SvgPicture.asset(
                                                "assets/vector/schedulenotif.svg")),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(item?.category ?? "-",
                                                  style: body.copyWith(
                                                      color: primaryColor,
                                                      fontWeight: semiBold),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.visible),
                                              Text("${item?.dueDate}",
                                                  style: tiny.copyWith(
                                                      color: greyColor,
                                                      fontWeight: medium)),
                                            ],
                                          ),
                                        ),
                                      ]),
                                    ));
                              }),
                        ),
                      ],
                    )
                  : const Center(child: CircularProgressIndicator.adaptive()));
        });
  }
}
