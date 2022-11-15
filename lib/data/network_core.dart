import 'package:dio/dio.dart';

import '../const/app_constant.dart';

class NetworkCore {
  Dio dio= Dio();
  NetworkCore(){
    dio.options=BaseOptions(baseUrl: baseUrl);
  }
}