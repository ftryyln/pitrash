import 'dart:async';
import 'dart:io';
import 'package:final_project/data/model/auth/login_model.dart';
import 'package:final_project/data/model/auth/logout_model.dart';
import 'package:final_project/data/model/auth/register_model.dart';
import 'package:final_project/data/model/carousel/carousel_model.dart';
import 'package:final_project/data/model/education/education_model.dart';
import 'package:final_project/data/model/notification/list_notif_model.dart';
import 'package:final_project/data/model/profile/edit_profile_model.dart';
import 'package:final_project/data/model/profile/profile_model.dart';
import 'package:final_project/data/model/schedule/schedule_payment_model.dart';
import 'package:final_project/data/model/schedule/schedule_pickup_model.dart';
import 'package:final_project/data/model/transaction/history_model.dart';
import 'package:final_project/data/model/transaction/transaction_model.dart';

abstract class Repository {
  FutureOr<LoginModel> postLogin(String email, String password);

  Future<RegisterModel?> postRegister(
      String name, String email,  String password, String phone, String address);

  FutureOr<LogoutModel> postLogout(String email, String password);

  FutureOr<TransactionModel> getTransaction();

  FutureOr<HistoryModel> getHistory();

  FutureOr<ProfileModel> getProfile();

  FutureOr<EditProfileModel?> postEditProfile(String id, String name,
      String email, String phone, String password, String address, File? image,
      String token);

  FutureOr<ListNotifModel> getNotificationList();

  FutureOr<EducationModel> getEducation();

  FutureOr<List<CarouselModel>> getCarousel();

  FutureOr<SchedulePickupModel> getSchedulePickup();

  FutureOr<SchedulePaymentModel> getSchedulePayment();
}
