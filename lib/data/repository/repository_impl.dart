import 'dart:async';
import 'package:dio/dio.dart';
import 'package:final_project/data/model/auth/login_model.dart';
import 'package:final_project/data/model/auth/logout_model.dart';
import 'package:final_project/data/model/auth/register_model.dart';
import 'package:final_project/data/model/education/education_model.dart';
import 'package:final_project/data/model/profile/profile_model.dart';
import 'package:final_project/data/model/transaction/history_transaction_model.dart';
import 'package:final_project/data/network_core.dart';
import 'package:final_project/data/repository/repository.dart';
import 'package:final_project/data/storage_core.dart';
import 'package:get/get.dart';

class RepositoryImpl implements Repository {
  final network = Get.find<NetworkCore>();
  final storage = Get.find<StorageCore>();

  @override
  FutureOr<LoginModel> postLogin(String email, String password) async {
    try {
      var response = await network.dio.post("/login",
          data: {"email": email, "password": password},
          options: Options(headers: {"Accept": "application/json"}));
      return LoginModel.fromJson(response.data);
    } on DioError catch (e) {
      return LoginModel.fromJson(e.response?.data);
    }
  }

  @override
  Future postRegister(String name, String email,
      String password, String phone, String address) async {
    try {
      var response = await network.dio.post("/register",
          data: {
            "name": name,
            "phone": phone,
            "email": email,
            "password": password,
            "address": address,
          },
          options: Options(headers: {"Accept": "application/json"}));

      return RegisterModel.fromJson(response.data);
    } on DioError catch (e) {
      return RegisterModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<LogoutModel> postLogout(String email, String password) async {
    try {
      var response = await network.dio.post("/logout",
          data: {"email": email, "password": password},
          options: Options(headers: {"Accept": "application/json"}));
      return LogoutModel.fromJson(response.data);
    } on DioError catch (e) {
      return LogoutModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<HistoryTransactionModel> getHistoryTransaction() async {
    try {
      var response = await network.dio.get("/transaction",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer ${storage.getAccessToken()}"
          }));
      return HistoryTransactionModel.fromJson(response.data);
    } on DioError catch (e) {
      return HistoryTransactionModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<ProfileModel> getProfile() async {
    try {
      var response = await network.dio.get("/user/${storage.getCurrentUserId()}",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer ${storage.getAccessToken()}"
          }));
      return ProfileModel.fromJson(response.data);
    } on DioError catch (e) {
      return ProfileModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<EducationModel> getEducation() async {
    try {
      var response = await network.dio.get("/user/${storage.getCurrentUserId()}",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer ${storage.getAccessToken()}"
          }));
      return EducationModel.fromJson(response.data);
    } on DioError catch (e) {
      return EducationModel.fromJson(e.response?.data);
    }
  }

  // @override
  // FutureOr<ScheduleModel> getSchedule() async {
  //   try {
  //     var response = await network.dio.get("/user/${storage.getCurrentUserId()}",
  //         options: Options(headers: {
  //           "Accept": "application/json",
  //           "Authorization": "Bearer ${storage.getAccessToken()}"
  //         }));
  //     return ScheduleModel.fromJson(response.data);
  //   } on DioError catch (e) {
  //     return ScheduleModel.fromJson(e.response?.data);
  //   }
  // }

  // @override
  // Future<FutureOr> postUpdateProfile(String id, String name, String email, String phone, String password, String address, File image, String token) async {
  //   try {
  //     var formData = FormData.fromMap({
  //       "id": id,
  //       "name": name,
  //       "email": email,
  //       "phone": phone,
  //       "password": password,
  //       "address": address,
  //     });
  //
  //     if (image != null) {
  //       formData.files.addAll(
  //       [MapEntry("image", await MultipartFile.fromFile(image.path))]);
  //   }
  //
  //   var response = await network.dio.post("/post",
  //   data: formData,
  //   options: Options(headers: {
  //   "Authorization": "Bearer $token",
  //   "Accept": "application/json",
  //   "Content-Type": "multipart/form-data"
  //   }));
  //   return PostUpdatProfileModel.fromJson(response.data);
  //   } on DioError {
  //   return null;
  //   }
  // }
}
