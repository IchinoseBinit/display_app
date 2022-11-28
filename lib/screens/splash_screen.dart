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

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
  void didChangeDependencies() {
    super.didChangeDependencies();

    getLocation().then((value) {
      checkToken(context, value);
    }).onError((error, stackTrace) => checkToken(context, null));
  }

  @override
  Widget build(BuildContext context) {
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
      final val = await askPermission();
      if (val != null) {
        return val;
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        final val = await askPermission();
        if (val != null) {
          return val;
        }
      }
    }

    if (permission == LocationPermission.deniedForever) {
      final val = await askPermission();
      if (val != null) {
        return val;
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  askPermission() async {
    await openAppSettings();
    final permission = await Geolocator.requestPermission();
    final hasPermission = permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
    if (!hasPermission) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }
}
