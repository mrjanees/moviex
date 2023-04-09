import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mspot/controllers/login/login_controllers.dart';
import '../views/dialogs/error_snackbar.dart';

class DioErrorTypeMessage {
  static dynamic toShowErrorMessage(DioErrorType name) {
    switch (name) {
      case DioErrorType.connectionTimeout:
        LoginControllers.hideLoading();
        return errorSnackbar('Somthing went wrong', 'connection timeout',
            Icons.hourglass_bottom_rounded, 3);
      case DioErrorType.sendTimeout:
        LoginControllers.hideLoading();
        return errorSnackbar(
            'Somthing went wrong', 'send timeout', Icons.send_to_mobile, 3);
      case DioErrorType.receiveTimeout:
        LoginControllers.hideLoading();
        return errorSnackbar('Somthing went wrong', 'receive timeout',
            Icons.running_with_errors_rounded, 3);
      case DioErrorType.badCertificate:
        LoginControllers.hideLoading();
        return errorSnackbar('Somthing went wrong', 'bad certificate',
            Icons.mood_bad_rounded, 3);
      case DioErrorType.badResponse:
        LoginControllers.hideLoading();
        return errorSnackbar('Invalid data', 'invalid usrename or password',
            Icons.error_outline_rounded, 3);
      case DioErrorType.cancel:
        LoginControllers.hideLoading();
        return errorSnackbar(
            'Somting went wrong', 'request cancelled', Icons.cancel_rounded, 3);
      case DioErrorType.connectionError:
        LoginControllers.hideLoading();
        return errorSnackbar(
            'Somthing went wrong', 'Connection error', Icons.perm_scan_wifi, 3);
      case DioErrorType.unknown:
        LoginControllers.hideLoading();
        return errorSnackbar('No internet', 'please check your internet',
            Icons.wifi_off_outlined, 3);
    }
  }
}
