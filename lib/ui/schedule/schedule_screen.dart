import 'package:calendar_view/calendar_view.dart';
import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/home/home_screen.dart';
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
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 430,
                  width: Get.width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: SizedBox(
                    height: 400,
                    child: MonthView(
                      controller: controller.eventController,
                      // to provide custom UI for month cells.
                      cellBuilder: (date, events, isToday, isInMonth) {
                        // Return your widget to display as month cell.
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)
                          ),
                        );
                      },
                      minMonth: DateTime(2010),
                      maxMonth: DateTime(2050),
                      initialMonth: DateTime(2022),
                      cellAspectRatio: 1,
                      onPageChange: (date, pageIndex) => print("$date, $pageIndex"),
                      onCellTap: (events, date) {
                        // Implement callback when user taps on a cell.
                        print(events);
                      },
                      startDay: WeekDays.monday,
                      // To change the first day of the week.
                      // This callback will only work if cellBuilder is null.
                      onEventTap: (event, date) => print(event),
                      onDateLongPress: (date) => print(date),
                    ),
                  ),
                ),
              ));
        });
  }
}
