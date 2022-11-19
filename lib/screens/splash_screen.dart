import 'dart:developer';

import 'package:flutter/material.dart';

import '/constants/constant.dart';
import '/constants/storage_constants.dart';
import '/screens/login_screen.dart';
import '/utils/dio_client.dart';
import '/utils/fetch_content.dart';
import '/utils/navigate.dart';
import '/utils/preferences_helper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final val = PreferencesHelper.readKey(key: StorageConstants.tokenKey);
    log(val.toString(), name: "token");
    if (val != null && val.isNotEmpty) {
      DioClient();
      DioClient.token = val;
      FetchContent().fetchAllContent(context);
    } else {
      Future.delayed(
        const Duration(seconds: 2),
        () => navigateReplacement(
          context,
          LoginScreen(),
        ),
      );
    }

    return const Scaffold(
      backgroundColor: baseColor,
      body: Center(
          child: Icon(
        Icons.abc_outlined,
      )),
    );
  }
}
