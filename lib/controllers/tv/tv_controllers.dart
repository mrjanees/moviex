import 'package:get/get.dart';
import 'package:mspot/models/tv_screen/top_rated_tv/top_rated_tv_result.dart';
import 'package:mspot/services/tv_screen_api/top_rated/implementation.dart';

import '../../utils/dioerror_message.dart';

class TvControllers extends GetxController {
  @override
  void onInit() {
    topRatedTv();
    super.onInit();
  }

  List<TopRatedTvResult> topRatedTvList = <TopRatedTvResult>[].obs;
  Future<void> topRatedTv() async {
    final response = await TopRatedTvImpl().topRatedTv();
    response.fold((l) {
      DioErrorTypeMessage.toShowErrorMessage(l);
    }, (r) {
      if (r == null) {
        print('Top Rated Tv is null');
      } else {
        topRatedTvList.addAll(r);
      }
    });
  }
}
