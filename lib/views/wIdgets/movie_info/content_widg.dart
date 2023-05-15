import 'package:flutter/material.dart';
import 'package:mspot/core/Font_style.dart';
import 'package:mspot/core/colors/app_color.dart';
import 'package:mspot/utils/get_language_name_by_Id.dart';

enum Mediatype { movie, tv }

class ContentTemp extends StatelessWidget {
  Mediatype mediatype;
  String? revenue;
  String? orginalLanguage;
  String? status;
  String? budget;
  String? overview;
  double h10p;
  double w10p;
  ContentTemp({
    super.key,
    this.budget,
    this.orginalLanguage,
    this.overview,
    this.revenue,
    this.status,
    required this.mediatype,
    required this.h10p,
    required this.w10p,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overview',
            style: MoviexFontStyle.heading1(),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            overview == null ? 'Overview : N/A' : overview!,
            maxLines: 8,
            overflow: TextOverflow.ellipsis,
            style:
                const TextStyle(color: WHITE_COLOR, height: 1.2, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 35,
                width: status!.length > 9 ? w10p * 5 : w10p * 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: mediatype == Mediatype.movie
                            ? status == 'Released'
                                ? Colors.lightGreenAccent[400]!
                                : Colors.red
                            : status == 'Ended'
                                ? Colors.red
                                : Colors.lightGreenAccent[400]!)),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        text: 'Status : ',
                        style: const TextStyle(
                            fontSize: 14,
                            color: WHITE_COLOR,
                            fontWeight: FontWeight.w300),
                        children: [
                          TextSpan(
                              text: status ?? '',
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: WHITE_COLOR,
                                  fontWeight: FontWeight.bold))
                        ]),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 35,
                width: budget!.length >= 6 ? w10p * 5.2 : w10p * 3.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2, color: ELEMENT_COLOR)),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        text: mediatype == Mediatype.movie
                            ? 'Budget : '
                            : 'Network : ',
                        style: const TextStyle(
                            fontSize: 14,
                            color: WHITE_COLOR,
                            fontWeight: FontWeight.w300),
                        children: [
                          TextSpan(
                              text: budget ?? '',
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: WHITE_COLOR,
                                  fontWeight: FontWeight.bold))
                        ]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: h10p * 0.2),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 35,
                width: revenue!.length >= 9 ? w10p * 6 : w10p * 5.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2, color: ELEMENT_COLOR)),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        text: mediatype == Mediatype.movie
                            ? 'Revenue : '
                            : 'Type : ',
                        style: const TextStyle(
                            fontSize: 14,
                            color: WHITE_COLOR,
                            fontWeight: FontWeight.w300),
                        children: [
                          TextSpan(
                              text: revenue ?? '',
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: WHITE_COLOR,
                                  fontWeight: FontWeight.bold))
                        ]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: h10p * 0.2),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 35,
                width: orginalLanguage!.length > 7 ? w10p * 8.5 : w10p * 6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2, color: ELEMENT_COLOR)),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        text: 'Orginal Langauge : ',
                        style: const TextStyle(
                            fontSize: 14,
                            color: WHITE_COLOR,
                            fontWeight: FontWeight.w300),
                        children: [
                          TextSpan(
                              text: getLanguageName(orginalLanguage!),
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: WHITE_COLOR,
                                  fontWeight: FontWeight.bold))
                        ]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
