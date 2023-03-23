import 'package:get/get.dart';

class HomeControllers extends GetxController {
  final activeIndex = 0.obs;
  final categoryIdex = 0.obs;
  void onPageChanged(int index) {
    activeIndex.value = index;
  }

  void onCategoryChanged(int index) {
    categoryIdex.value = index;
  }
}
