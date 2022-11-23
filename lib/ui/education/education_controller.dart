import 'package:final_project/base/base_controller.dart';
import 'package:final_project/data/model/education/education_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum EduViewState {
  none,
  loading,
  error,
}

class EducationController extends BaseController {
  EduViewState _state = EduViewState.none;

  EduViewState get state => _state;
  EducationModel? educationModel;

  DateFormat formatter = DateFormat("yyyy-MM-ddTHH:mm:ss.000000Z");
  DateFormat toFormat = DateFormat("dd MMMM yyyy", "id");
  DateFormat toClockFormat = DateFormat("HH:mm");

  TextEditingController searchController = TextEditingController();

  List<Data?> data = [];

  @override
  void onInit() {
    super.onInit();
    getEducation();
  }

  changeState(EduViewState s) {
    _state = s;
    update();
  }

  getEducation() async {
    changeState(EduViewState.loading);
    try {
      var response = await repository.getEducation();

      educationModel = response;
      data = educationModel?.data ?? [];
      update();
    } catch (e) {
      return null;
    }
  }
}
