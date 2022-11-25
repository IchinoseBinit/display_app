import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import '/constants/constant.dart';
import '/constants/storage_constants.dart';
import '/screens/login_screen.dart';
import '/utils/dio_client.dart';
import '/utils/fetch_content.dart';
import '/utils/navigate.dart';
import '/utils/preferences_helper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  checkToken(BuildContext context, Position? position) {
    final val = PreferencesHelper.readKey(key: StorageConstants.tokenKey);
    log(val.toString(), name: "token");
    if (val != null && val.isNotEmpty) {
      DioClient();
      DioClient.token = val;
      FetchContent().fetchAllContent(context, position);
    } else {
      Future.delayed(
        const Duration(seconds: 2),
        () => navigateReplacement(
          context,
          LoginScreen(
            position: position,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    getLocation().then((value) {
      checkToken(context, value);
    }).onError((error, stackTrace) => checkToken(context, null));

    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }

  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
