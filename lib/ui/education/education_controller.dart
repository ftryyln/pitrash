import 'package:final_project/base/base_controller.dart';
import 'package:final_project/data/model/education/education_model.dart';

enum EduViewState {
  none,
  loading,
  error,
}

class EducationController extends BaseController {
  EduViewState _state = EduViewState.none;
  EduViewState get state => _state;
  EducationModel? educationModel;

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
      print(response);
      educationModel = response;
      update();
    } catch (e) {
      return null;
    }
  }
}
