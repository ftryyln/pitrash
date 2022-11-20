import 'package:carousel_slider/carousel_controller.dart';
import 'package:dio/dio.dart';
import 'package:final_project/base/base_controller.dart';
import 'package:final_project/data/model/education/education_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  List<Widget> image = [
    Image.asset('assets/image/home/poster.png'),
    Image.asset('assets/image/image.jpg'),
  ];

  String imageProfile = "";
  String name = "";
  String title = "";
  EducationModel? educationModel;

  var currentIndex = 0.obs;
  CarouselController carouselController = CarouselController();

  @override
  void onInit() {
    super.onInit();
    getProfile();
    getEducation();
    print(currentIndex);
    update();
  }

  getProfile() async {
    try {
      var response = await repository.getProfile();
      imageProfile = response.data?.userDetail?.image ?? "https://";
      name = response.data?.name ?? "-";
      update();
    } on DioError catch (e) {
      print(e.response?.data.toString());
    }
  }

  // getTransaction() async {
  //   try {
  //     var response = await repository.getTransaction();
  //     historyModel = response;
  //     update();
  //   } on DioError catch(e) {
  //     print(e.response?.data.toString());
  //   }
  // }

  getEducation() async {
    try {
      var response = await repository.getEducation();
      educationModel = response;
      update();
    } catch (e) {
      return null;
    }
  }

}
