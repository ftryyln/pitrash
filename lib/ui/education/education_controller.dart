import 'package:final_project/data/repository/repository.dart';
import 'package:get/get.dart';

class EducationController extends GetxController {
  final repository = Get.find<Repository>();

  static const limit = 9;

  // final PagingController<int, Results> pagingController =
  // PagingController(firstPageKey: 0);
  //
  // NumberFormat formatter = NumberFormat("#000");
  //
  // @override
  // void onInit() {
  //   pagingController.addPageRequestListener((pageKey) {
  //     _fetchPage(pageKey);
  //   });
  //   super.onInit();
  // }
  //
  // Future<void> _fetchPage(int offset) async {
  //   try {
  //     final newItems = await repository.getPagedPokemon(offset, limit);
  //     final isLastPage = newItems!.results!.length < limit;
  //     if (isLastPage) {
  //       pagingController.appendLastPage(newItems.results!);
  //     } else {
  //       final nextPageKey = offset + newItems.results!.length;
  //       pagingController.appendPage(newItems.results!, nextPageKey);
  //     }
  //   } catch (error) {
  //     pagingController.error = error;
  //   }
  // }
}
