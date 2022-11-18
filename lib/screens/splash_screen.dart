import '/constants/constant.dart';
import '/constants/storage_constants.dart';
import '/screens/login_screen.dart';
import '/utils/dio_client.dart';
import '/utils/fetch_content.dart';
import '/utils/navigate.dart';
import '/utils/preferences_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((value) async {
      PreferencesHelper.prefs = value;
      final val = PreferencesHelper.readKey(key: StorageConstants.tokenKey);
      if (val != null) {
        DioClient.token = val;
        FetchContent().fetchAllContent(context);
      } else {
        navigateReplacement(context, LoginScreen());
      }
    });

    return const Scaffold(
      backgroundColor: baseColor,
      body: Center(
          child: Icon(
        Icons.abc_outlined,
      )),
    );
  }
}
