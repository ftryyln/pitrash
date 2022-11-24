import 'dart:io';

import 'package:dio/dio.dart';
import 'package:final_project/base/base_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../data/model/schedule/schedule_payment_model.dart';
import '../../../data/storage_core.dart';

enum DetailPaymentViewState {
  none,
  loading,
  error,
}

class DetailPaymentController extends BaseController {
  DetailPaymentViewState _state = DetailPaymentViewState.none;
  DetailPaymentViewState get state => _state;
  SchedulePaymentModel? schedulePaymentModel;

  String? token = StorageCore().getAccessToken();

  File? gettedFile;

  DateFormat formatter = DateFormat("EEE, MMM dd, yyyy");
  DateFormat toDateFormat = DateFormat("dd MMMM yyyy", "id");

  @override
  void onInit() {
    super.onInit();
    getSchedulePayment();
  }

  changeState(DetailPaymentViewState s) {
    _state = s;
    update();
  }

  getSinglePhoto() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      File file = File(image.path);
      gettedFile = file;
      update();
    } else {
      // User canceled the picker
    }
  }

  Future<void> getSchedulePayment() async {
    changeState(DetailPaymentViewState.loading);
    try {
      var response = await repository.getSchedulePayment();
      schedulePaymentModel = response;
      update();
      changeState(DetailPaymentViewState.none);
    } catch (e) {
      return;
    }
  }

  postUploadPayment() async {
    try {
      var response = await repository.postUploadPayment(gettedFile, token!);
      Fluttertoast.showToast(msg: response.meta!.message!);
      if (response.meta?.status?.toLowerCase() == "success") {
        Get.back();
      }
    } on DioError catch(e) {
      Get.showSnackbar(GetSnackBar(message: "Terjadi Kesalahan ${e.response?.statusMessage}",));
    }
  }
}
