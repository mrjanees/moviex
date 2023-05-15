import 'package:flutter/material.dart';

class MovieGenerateModelLocal{
  String language;
  List<int> genres;
  String initialDate;
  String finalDate;
  MovieGenerateModelLocal.create(
      {required this.finalDate,
      required this.genres,
      required this.initialDate,
      required this.language});
  @override
  String toString() {
    return '$language,$genres,$initialDate,$finalDate';
  }
}
