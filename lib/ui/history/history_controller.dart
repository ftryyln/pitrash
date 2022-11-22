import 'package:dio/dio.dart';
import 'package:final_project/base/base_controller.dart';
import 'package:final_project/data/model/transaction/history_model.dart';
import 'package:intl/intl.dart';

class HistoryController extends BaseController{

  HistoryModel? historyModel;

  DateFormat formatter = DateFormat("yyyy-MM-ddTHH:mm:ss.000000Z");
  DateFormat toFormat = DateFormat("MMMM yyyy");
  NumberFormat numberFormat = NumberFormat.currency(
    decimalDigits: 0,
    locale: "id",
    symbol: "Rp ",
  );

  @override
  onInit() {
    getHistory();
    super.onInit();
  }

  getHistory() async {
    try {
      var response = await repository.getHistory();
      historyModel = response;
      update();
    } on DioError catch(e) {
      print(e.response?.data.toString());
    }
  }
}