import 'dart:async';
import 'package:final_project/data/model/auth/login_model.dart';
import 'package:final_project/data/model/auth/logout_model.dart';
import 'package:final_project/data/model/auth/register_model.dart';
import 'package:final_project/data/model/education/education_model.dart';
import 'package:final_project/data/model/notification/list_notif_model.dart';
import 'package:final_project/data/model/profile/profile_model.dart';
import 'package:final_project/data/model/transaction/history_transaction_model.dart';

abstract class Repository {
  FutureOr<LoginModel> postLogin(String email, String password);

  Future<RegisterModel?> postRegister(
      String name, String phone, String email, String password, String address);

  FutureOr<LogoutModel> postLogout(String email, String password);

  FutureOr<HistoryTransactionModel> getHistoryTransaction();

  FutureOr<ProfileModel> getProfile();

  // FutureOr<UpdateProfileModel?> postUpdateProfile(String id,
  //     String name, String email, String phone, String password, String address, File? image, String token);

  FutureOr<ListNotifModel> getNotificationList();

  FutureOr<EducationModel> getEducation();

  // FutureOr<EducationModel> getSchedule();
}
