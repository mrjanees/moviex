import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mspot/views/dialogs/error_snackbar.dart';
import 'package:mspot/views/wIdgets/movie/generate/select_genres.dart';
import 'package:mspot/views/wIdgets/movie/generate/select_language.dart';
import 'package:mspot/views/wIdgets/movie/generate/single_choice_chip.dart';

import '../../../../core/colors/app_color.dart';

void selectDate() {
  Get.dialog(
    LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        double h10p = maxWidth * 0.1;
        return Padding(
          padding: EdgeInsets.only(
            top: h10p * 3.5,
            bottom: h10p * 4,
          ),
          child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/background_image/Generate movie list.jpg'))),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20, top: 10),
                          child: Text('Select Date',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                  color: WHITE_COLOR)),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const InitialDate(),
                        const SizedBox(
                          height: 8,
                        ),
                        const FinalDate(),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    backgroundColor: ELEMENT_COLOR,
                                    padding: const EdgeInsets.all(8)),
                                onPressed: () {
                                  Get.back();
                                  selectLanguage();
                                },
                                child: const Icon(Icons.navigate_before)),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    backgroundColor: ELEMENT_COLOR,
                                    padding: const EdgeInsets.all(8)),
                                onPressed: () {
                                  print(initialDate);
                                  print(finalDate);

                                  if (initialDate == null ||
                                      finalDate == null) {
                                    errorSnackbar(
                                        'Date is Empty',
                                        'please select Date',
                                        Icons.calendar_month_sharp,
                                        2);
                                  } else {
                                    Get.back();
                                    selectGenres();
                                  }
                                },
                                child: const Icon(Icons.navigate_next))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )),
        );
      },
    ),
    barrierDismissible: false,
  );
}

class InitialDate extends StatefulWidget {
  const InitialDate({super.key});

  @override
  State<InitialDate> createState() => _DateState();
}

DateTime? initialDate;

class _DateState extends State<InitialDate> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        final selectedDateTemp = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.parse('1900-01-01'),
          lastDate: DateTime.now(),
        );
        if (selectedDateTemp == null) {
          return;
        }
        setState(() {
          initialDate = selectedDateTemp;
        });
      },
      icon: const Icon(Icons.calendar_today),
      label: Text(
        initialDate == null
            ? 'selected Initaildate'
            : DateFormat.yMMMd().format(initialDate!),
      ),
    );
  }
}

class FinalDate extends StatefulWidget {
  const FinalDate({super.key});

  @override
  State<FinalDate> createState() => FinalDateData();
}

DateTime? finalDate;

class FinalDateData extends State<FinalDate> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        final selectedDateTemp = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.parse('1900-01-01'),
          lastDate: DateTime.now(),
        );
        if (selectedDateTemp == null) {
          return;
        }
        setState(() {
          finalDate = selectedDateTemp;
        });
      },
      icon: const Icon(
        Icons.calendar_today,
        color: WHITE_COLOR,
      ),
      label: Text(
        finalDate == null
            ? 'selected Final date'
            : DateFormat.yMMMd().format(finalDate!),
      ),
    );
  }
}
