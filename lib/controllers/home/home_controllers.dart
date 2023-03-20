import 'package:get/get.dart';

class HomeControllers extends GetxController {
  final activeIndex = 0.obs;
  void onPageChanged(int index) {
    activeIndex.value = index;
  }
}
