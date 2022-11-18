import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '/constants/constant.dart';
import '/utils/show_toast_message.dart';

class ErrorHandler {
  static const errorMessage =
      "Cannot process at the moment. Please try again later.";

  errorHandler(
    BuildContext context,
    Object ex,
  ) {
    final isFormatException = ex.runtimeType.toString() == "_TypeError";

    if (isFormatException) {
      Navigator.pop(context);
      showToast(ex.toString(), color: baseColor);
    } else {
      var message = "";
      // socket exception
      if (ex is DioError && ex.error.runtimeType == SocketException) {
        message = ErrorHandler.errorMessage;
      } else {
        message = ex.toString();
      }

      Navigator.pop(context);
      showToast(message, color: baseColor);
    }
  }
}
