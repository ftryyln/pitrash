import 'package:final_project/data/repository/repository_impl.dart';
import 'package:get/get.dart';

import '../data/repository/repository.dart';

class BaseController extends GetxController {
  final Repository repository = Get.find<Repository>();
}