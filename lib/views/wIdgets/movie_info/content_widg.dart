import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mspot/core/Font_style.dart';
import 'package:mspot/core/colors/app_color.dart';

class ContentTemp extends StatelessWidget {
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
            children: [
              Container(
                height: h10p * 0.6,
                width: w10p * 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.lightGreenAccent[400]!)),
                child: Center(
                  child: Text(
                    status == null ? 'Status : N/A' : 'Status : $status',
                    style: const TextStyle(
                        fontSize: 14,
                        color: WHITE_COLOR,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                width: w10p * 0.2,
              ),
              Container(
                height: h10p * 0.6,
                width: w10p * 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2, color: ELEMENT_COLOR)),
                child: Center(
                  child: Text(
                    budget == null ? 'Budget : N/A' : 'Budget : $budget',
                    style: const TextStyle(
                        fontSize: 14,
                        color: WHITE_COLOR,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: h10p * 0.2),
          Row(
            children: [
              Container(
                height: h10p * 0.6,
                width: w10p * 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2, color: ELEMENT_COLOR)),
                child: Center(
                  child: Text(
                    revenue == null ? 'Revenue : N/A' : 'Revenue : $revenue',
                    style: const TextStyle(
                        fontSize: 14,
                        color: WHITE_COLOR,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: h10p * 0.2),
          Container(
            height: h10p * 0.6,
            width: w10p * 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 2, color: ELEMENT_COLOR)),
            child: Center(
              child: Text(
                orginalLanguage == null
                    ? 'Orginal Language : N/A'
                    : 'Orginal Language : $orginalLanguage',
                style: const TextStyle(
                    fontSize: 14,
                    color: WHITE_COLOR,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
