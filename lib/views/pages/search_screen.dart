import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mspot/controllers/search/search_controllers.dart';
import 'package:mspot/core/Font_style.dart';
import 'package:mspot/services/search_screen_api/search_movie/implementation.dart';
import 'package:mspot/views/dialogs/error_snackbar.dart';
import 'package:mspot/views/dialogs/loding_circle.dart';
import 'package:mspot/views/pages/home_screen/home_screen.dart';
import 'package:mspot/views/wIdgets/common/server_page_controller.dart';
import 'package:mspot/views/wIdgets/search_screen/searched_items_temp.dart';
import 'package:mspot/views/wIdgets/search_screen/toprated_search_temp.dart';
import '../../core/colors/app_color.dart';
import '../wIdgets/search_screen/app_bar_search.dart';
import '../wIdgets/search_screen/appbar_title.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        searchControllers.searchResultList.clear();
        searchControllers.onInit();
        searchTextController.clear();
      },
    );
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxHeight = constraints.maxHeight;
        final maxWidth = constraints.maxWidth;
        double h1p = maxHeight * 0.01;

        double w1p = maxWidth * 0.01;

        return Obx(
          () => Scaffold(
            body: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: RefreshIndicator(
                onRefresh: () async{ SearchControllers.instance.onInit(); },
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverAppBar(
                      titleSpacing: w1p * 3,
                      title: const AppbarTitle(),
                      expandedHeight: 120,
                      actions: [
                        IconButton(
                            onPressed: () {
                              Get.toNamed('/profile');
                            },
                            icon: SvgPicture.asset(
                                height: 30,
                                width: 30,
                                colorFilter: const ColorFilter.mode(
                                    Colors.white, BlendMode.srcIn),
                                'assets/icons/user.svg'))
                      ],
                      automaticallyImplyLeading: false,
                      backgroundColor: BACKGROUND_COLOR,
                      floating: true,
                      snap: true,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Padding(
                          padding: EdgeInsets.only(
                              top: 60, right: w1p * 3, left: w1p * 3),
                          child: SizedBox(width: 100, child: AppbarSearch()),
                        ),
                      ),
                    )
                  ],
                  body: Padding(
                    padding: EdgeInsets.only(
                        left: w1p * 3, right: w1p * 3, top: h1p * 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              searchControllers.searchPageTitle.value,
                              style: MoviexFontStyle.heading1(),
                            ),
                            searchControllers.searchResultList.isNotEmpty
                                ? ServerPageController(
                                    width: w1p,
                                    height: h1p,
                                    page: searchControllers.serverPage.value,
                                    pageDecrement: () {
                                      if (searchControllers.serverPage.value >
                                          1) {
                                        final num = searchControllers
                                            .serverPage.value -= 1;
                                        searchControllers.searchMovie(
                                            searchTextController.text, num);
                                      } else {
                                        errorSnackbar(
                                            'No pages',
                                            'There is no items',
                                            Icons.cancel_outlined,
                                            2);
                                      }
                                    },
                                    pageIncrement: () {
                                      if (searchControllers.serverPage.value <
                                          searchControllers.totalpage.value) {
                                        final num = searchControllers
                                            .serverPage.value += 1;
                                        searchControllers.searchMovie(
                                            searchTextController.text, num);
                                      } else {
                                        errorSnackbar(
                                            'No pages',
                                            'There is no items',
                                            Icons.cancel_outlined,
                                            2);
                                      }
                                    })
                                : const SizedBox()
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (searchControllers.searchResultList.isEmpty)
                          const TopRatedSearchTemplate()
                        else
                          SearchedItemTemplate()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
