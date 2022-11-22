import 'package:calendar_view/calendar_view.dart';
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
              body: controller.scheduleModel != null ? ListView.builder(itemCount: controller.scheduleModel?.data?.history?.length, itemBuilder: (context, index) {
                var item =  controller.scheduleModel?.data?.history?[index];
                return ListTile(
                  title: Text(item?.category ?? "-"),
                  subtitle: Text("${item?.beginDate} - ${item?.dueDate}"),
                );
              }) : const Center(child: CircularProgressIndicator.adaptive())
          );
        });
  }
}
