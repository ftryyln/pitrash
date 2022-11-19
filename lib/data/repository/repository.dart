import 'dart:async';
import 'dart:io';
import 'package:final_project/data/model/auth/login_model.dart';
import 'package:final_project/data/model/auth/logout_model.dart';
import 'package:final_project/data/model/auth/register_model.dart';
import 'package:final_project/data/model/profile/profile_model.dart';
import 'package:final_project/data/model/transaction/history_transaction_model.dart';

abstract class Repository {
  FutureOr<LoginModel> postLogin(String email, String password);

  FutureOr<RegisterModel> postRegister(
      String name, String phone, String email, String password, String address);

  FutureOr<HistoryTransactionModel> getHistoryTransaction();

  FutureOr<LogoutModel> postLogout(String email, String password);

  FutureOr<ProfileModel> getProfile();

  // FutureOr<UpdateProfileModel?> postUpdateProfile(String id,
  //     String name, String email, String phone, String password, String address, File? image, String token);
}
