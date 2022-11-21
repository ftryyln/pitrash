import 'package:carousel_slider/carousel_controller.dart';
import 'package:dio/dio.dart';
import 'package:final_project/base/base_controller.dart';
import 'package:final_project/data/model/carousel/carousel_model.dart';
import 'package:final_project/data/model/education/education_model.dart';
import 'package:final_project/data/model/transaction/transaction_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

enum HomeViewState {
  none,
  loading,
  error,
}

class HomeController extends BaseController {
  HomeViewState _state = HomeViewState.none;

  HomeViewState get state => _state;
  String imageProfile = "";
  List<String> imageCarousel = [];
  List<CarouselModel> listCarousel = [];
  String name = "";
  String title = "";
  EducationModel? educationModel;
  TransactionModel? transactionModel;

  DateFormat formatter = DateFormat("yyyy-MM-ddTHH:mm:ss.000000Z");
  DateFormat toFormat = DateFormat("MMMM yyyy");
  NumberFormat numberFormat = NumberFormat.currency(
    decimalDigits: 0,
    locale: "id",
    symbol: "Rp ",
  );

  var currentIndex = 0.obs;
  CarouselController carouselController = CarouselController();

  @override
  void onInit() {
    super.onInit();
    getCarousel();
    getProfile();
    getEducation();
    getTransaction();
  }

  changeState(HomeViewState s) {
    _state = s;
    update();
  }

  Future<void> getProfile() async {
    try {
      var response = await repository.getProfile();
      imageProfile = response.data?.userDetail?.image ?? "https://";
      name = response.data?.name ?? "-";
      update();
    } on DioError catch (e) {
      print(e.response?.data.toString());
    }
  }

  Future<void> getCarousel() async {
    changeState(HomeViewState.loading);
    try {
      var response = await repository.getCarousel();
      listCarousel = response;
      print(response);
      update();
      changeState(HomeViewState.none);
    } catch (e) {
      print(e.toString());
      update();
    }
  }

  Future<void> getTransaction() async {
    try {
      var response = await repository.getTransaction();
      transactionModel = response;
      update();
    } on DioError catch (e) {
      print(e.response?.data.toString());
    }
  }

  Future<void> getEducation() async {
    changeState(HomeViewState.loading);
    try {
      var response = await repository.getEducation();
      educationModel = response;
      update();
      changeState(HomeViewState.none);
    } catch (e) {
      return null;
    }
  }
}
