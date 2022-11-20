import 'dart:async';

import 'package:dio/dio.dart';
import 'package:final_project/base/base_controller.dart';
import 'package:final_project/data/model/notification/list_notif_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class NotificationController extends BaseController {
  int groupValue = 0;

  ListNotifModel? listNotifModel;

  @override
  onInit() {
    fetchNotificationList();
    super.onInit();
  }

  FutureOr<ListNotifModel?> fetchNotificationList() async {
    try {
      var response = await repository.getNotificationList();
      listNotifModel = response;
      update();
      return response;
    } on DioError catch (e) {
      Fluttertoast.showToast(msg: e.response.toString());
      return null;
    }
  }
}