import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mspot/controllers/person_info/person_info_controller.dart';
import 'package:mspot/core/colors/app_color.dart';
import 'package:mspot/views/wIdgets/person_info_screen/known_for.dart';
import 'package:mspot/views/wIdgets/person_info_screen/known_for_card.dart';
import 'package:mspot/views/wIdgets/person_info_screen/main_card.dart';
import '../../core/Font_style.dart';

PersonInfoController personInfoController =
    Get.put(PersonInfoController.instance);

class PersonInfoScreen extends StatelessWidget {
  const PersonInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background_image/new.jpg'),
              fit: BoxFit.cover),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double maxWidth = constraints.maxWidth;
            double w1p = constraints.maxWidth * 0.01;
            double h1p = constraints.maxHeight * 0.01;
            double w10p = constraints.maxWidth * 0.1;
            double h10p = constraints.maxHeight * 0.1;
            final personInfodata = personInfoController.personInfoData.value;
            return NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  titleSpacing: w1p * 3,
                  title: Text(
                    'Person Info',
                    style: MoviexFontStyle.heading1(),
                  ),
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
                  floating: true,
                  snap: true,
                )
              ],
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: PersonInfoMainCard(
                          h10p: h10p,
                          w10p: w10p,
                          alsoKnownAs: personInfodata.alsoKnownAs.toString(),
                          birthDate: personInfodata.birthday!,
                          birthPlace: personInfodata.placeOfBirth!,
                          image: personInfodata.profilePath,
                          knownFor: personInfodata.knownForDepartment!,
                          name: personInfodata.name!,
                        )),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Biography',
                        style: MoviexFontStyle.heading2(),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        personInfodata.biography!,
                        style:
                            const TextStyle(color: WHITE_COLOR, fontSize: 15),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Known For',
                        style: MoviexFontStyle.heading2(),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const KnownFor()
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
