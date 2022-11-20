import 'package:final_project/data/storage_core.dart';
import 'package:get/get.dart';
import '../data/repository/repository.dart';

class BaseController extends GetxController {
  final repository = Get.find<Repository>();
  final storage = Get.find<StorageCore>();
}