import 'package:dio/dio.dart';
import 'package:final_project/base/base_controller.dart';
import 'package:final_project/data/model/schedule/schedule_pickup_model.dart';

enum ScheduleViewState {
  none,
  loading,
  error,
}

class ScheduleController extends BaseController {
  ScheduleViewState _state = ScheduleViewState.none;
  ScheduleViewState get state => _state;
  SchedulePickupModel? schedulePickupModel;

  @override
  onInit() {
    getSchedulePickup();
    super.onInit();
  }

  changeState(ScheduleViewState s) {
    _state = s;
    update();
  }

  Future<void> getSchedulePickup() async {
    changeState(ScheduleViewState.loading);
    try {
      var response = await repository.getSchedulePickup();
      schedulePickupModel = response;
      update();
      changeState(ScheduleViewState.none);
    } on DioError catch(e) {
      update();
    }
  }

}