import 'package:final_project/data/network_core.dart';
import 'package:final_project/data/repository/repository_impl.dart';
import 'package:final_project/data/storage_core.dart';
import 'package:get/get.dart';

import '../data/repository/repository.dart';

class GlobalBindings extends Bindings{
  @override
  void dependencies() {
   Get.put<NetworkCore>(NetworkCore());
   Get.put<StorageCore>(StorageCore());
   Get.put<Repository>(RepositoryImpl());
  }

}