import 'package:get/get.dart';
import 'package:mspot/models/actor_screen/top_rated_people/result.dart';
import 'package:mspot/services/actor_screen_api/top_rated_people/implementation.dart';

import '../../utils/dioerror_message.dart';

class ActorsControllers extends GetxController {
  @override
  void onInit() {
    topRatedPeople();
    super.onInit();
  }

  List<Result> topRatedPeopleList = <Result>[].obs;
  Future<void> topRatedPeople() async {
    final response = await TopRatedPeopleImple().topRatedPeople();
    response.fold((l) {
      DioErrorTypeMessage.toShowErrorMessage(l);
    }, (r) {
      if (r == null) {
        print('Top Rated Tv is null');
      } else {
        topRatedPeopleList.addAll(r);
      }
    });
  }
}
