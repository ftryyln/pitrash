import 'package:calendar_view/calendar_view.dart';
import 'package:dio/dio.dart';
import 'package:final_project/base/base_controller.dart';
import 'package:final_project/data/model/schedule/schedule_model.dart';
import 'package:get/get.dart';

class ScheduleController extends BaseController {

  ScheduleModel? scheduleModel;

  @override
  onInit() {
    getScheduleData();
    super.onInit();
  }

  Future<void> getScheduleData() async {
    try {
      var response = await repository.getSchedule();
      scheduleModel = response;
      update();
    } on DioError catch(e) {
      scheduleModel = ScheduleModel.fromJson(e.response?.data);
      update();
    }
  }

}