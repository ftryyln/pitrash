import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:final_project/data/model/auth/login_model.dart';
import 'package:final_project/data/model/auth/logout_model.dart';
import 'package:final_project/data/model/auth/register_model.dart';
import 'package:final_project/data/model/carousel/carousel_model.dart';
import 'package:final_project/data/model/education/education_model.dart';
import 'package:final_project/data/model/notification/list_notif_model.dart';
import 'package:final_project/data/model/profile/edit_profile_model.dart';
import 'package:final_project/data/model/profile/profile_model.dart';
import 'package:final_project/data/model/schedule/schedule_model.dart';
import 'package:final_project/data/model/transaction/history_model.dart';
import 'package:final_project/data/model/transaction/transaction_model.dart';
import 'package:final_project/data/network_core.dart';
import 'package:final_project/data/repository/repository.dart';
import 'package:final_project/data/storage_core.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;

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
  Future<RegisterModel?> postRegister(String name, String email,
      String password, String phone,
      String address) async {
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
  FutureOr<TransactionModel> getTransaction() async {
    try {
      var response = await network.dio.get("/transaction/user",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer ${storage.getAccessToken()}"
          }));
      return TransactionModel.fromJson(response.data);
    } on DioError catch (e) {
      return TransactionModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<ProfileModel> getProfile() async {
    try {
      var response =
      await network.dio.get("/user/${storage.getCurrentUserId()}",
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
      var response =
      await network.dio.get("/education/",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer ${storage.getAccessToken()}"
          }));
      return EducationModel.fromJson(response.data);
    } on DioError catch (e) {
      return EducationModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<ListNotifModel> getNotificationList() async {
    try {
      var response =
      await network.dio.get("/notification",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer ${storage.getAccessToken()}"
          }));
      return ListNotifModel.fromJson(response.data);
    } on DioError catch (e) {
      return ListNotifModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<List<CarouselModel>> getCarousel() async {
    try {
      var response =
      await network.dio.get("/poster",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer ${storage.getAccessToken()}"
          }));
      List<dynamic> listData = response.data['data'];
      List<CarouselModel> listCategory = listData.map((e) =>
          CarouselModel.fromJson(e)).toList();
      return listCategory;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  FutureOr<ScheduleModel> getSchedule() async {
    try {
      var response =
          await network.dio.get("/schedule/pickup",
          options: Options(headers: {
            "content-type": "application/json",
            "Authorization": "Bearer ${storage.getAccessToken()}"
          }));
      return ScheduleModel.fromJson(response.data);
    } on DioError catch (e) {
      // throw Exception(e.message);
      return ScheduleModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<EditProfileModel?> postEditProfile(String id, String name,
      String email, String phone, String password, String address, File? image,
      String token) async {
    try {
      var formData = FormData.fromMap({
        "name": name,
        "email": email,
        // "password": password,
        "address": address,
        "phone": phone,
      });

      if(image != null) {
        formData.files.addAll(
            [MapEntry("image", await MultipartFile.fromFile(image.path))]
        );
      }

      var response = await network.dio.post("/user/edit",
          data: formData,
          options: Options(headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json",
            "Content-Type": "multipart/form-data"
          }));
      return EditProfileModel.fromJson(response.data);
    } on DioError catch(e) {
      return EditProfileModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<HistoryModel> getHistory() async {
    try {
      var response = await network.dio.get("/transaction/user",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer ${storage.getAccessToken()}"
          }));
      return HistoryModel.fromJson(response.data);
    } on DioError catch (e) {
      return HistoryModel.fromJson(e.response?.data);
    }
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
// }
