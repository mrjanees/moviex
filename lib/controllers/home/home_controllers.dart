import 'dart:developer';
import 'package:get/get.dart';
import 'package:mspot/models/home_screen/upcoming/result.dart';
import 'package:mspot/services/home_screen_api/upcoming/implementation.dart';
import '../../utils/dioerror_message.dart';

class HomeControllers extends GetxController {
  final activeIndex = 0.obs;
  final categoryIdex = 0.obs;
  List<UpcomingResult> upcomingList = <UpcomingResult>[].obs;

  @override
  void onInit() {
    super.onInit();
    upcomingMovie();
  }

  Future<void> upcomingMovie() async {
    final data = await UpcomingMovieImple().upcoming();
    data.fold((l) {
      DioErrorTypeMessage.toShowErrorMessage(l);
    }, (r) {
      if (r == null) {
        log('there is no value');
      } else {
        for (var upMovie in r) {
          if (upcomingList.length <= 10) {
            upcomingList.add(upMovie);
          }
        }
      }
    });
  }

  void onPageChanged(int index) {
    activeIndex.value = index;
  }

  void onCategoryChanged(int index) {
    categoryIdex.value = index;
  }
}
