import 'package:dio/dio.dart';
import 'package:final_project/base/base_controller.dart';
import 'package:final_project/data/model/schedule/schedule_payment_model.dart';
import 'package:final_project/data/model/transaction/transaction_model.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:intl/intl.dart';

enum PaymentViewState {
  none,
  loading,
  error,
}

class PaymentController extends BaseController {
  PaymentViewState _state = PaymentViewState.none;
  PaymentViewState get state => _state;

  TransactionModel? transactionModel;
  SchedulePaymentModel? schedulePaymentModel;

  DateFormat formatter = DateFormat("EEE, MMM dd, yyyy");
  DateFormat toDateFormat = DateFormat("dd MMMM yyyy");
  DateFormat toFormat = DateFormat("MMMM yyyy");

  NumberFormat numberFormat = NumberFormat.currency(
    decimalDigits: 0,
    locale: "id",
    symbol: "Rp ",
  );

  @override
  void onInit() {
    super.onInit();
    getTransaction();
    getSchedulePayment();
  }

  void whatsAppOpen() async {
    await FlutterLaunch.launchWhatsapp(phone: "+62895619019395", message: "Saya akan membayar");
  }

  changeState(PaymentViewState s) {
    _state = s;
    update();
  }

  Future<void> getTransaction() async {
    changeState(PaymentViewState.loading);
    try {
      var response = await repository.getTransaction();
      transactionModel = response;
      update();
    } on DioError catch (e) {
      print(e.response?.data.toString());
    }
  }

  Future<void> getSchedulePayment() async {
    changeState(PaymentViewState.loading);
    try {
      var response = await repository.getSchedulePayment();
      schedulePaymentModel = response;
      update();
      changeState(PaymentViewState.none);
    } catch (e) {
      return null;
    }
  }
}