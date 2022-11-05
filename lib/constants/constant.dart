import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final navigatorKey = GlobalKey<NavigatorState>();

const Color primaryColor = Color(0xff135396);
const Color gradientDarkColor = Color(0xff000428);
const Color gradientLightColor = Color(0xff004E92);
const Color dividerColor = Color(0xffD9D9D9);
const Color secondaryColor = Color(0xff505050);

const double padding = 16.0;
final double radius = 8.r;

const String aboutUsUrl = "https://ssf.gov.np/pages/introduction";

const String privacyPolicyUrl = "https://sites.google.com/view/ssfnepal/";

const basePadding =
    EdgeInsets.symmetric(horizontal: padding, vertical: padding * 1.5);

const tokenKey = "token";

// Language
const themeKey = "theme";
const lightKey = "light";
const darkKey = "dark";

// Language
const languageKey = "language";
const englishValue = "english";
const nepaliValue = "nepali";

// Secure Storage Login Credentials
const phoneKey = "phone";
const passwordKey = "password";

// Notification key
const isNotificationEnabledKey = "notification";
const ssfTopicKey = "ssf-all";

// Withdraw Draft
const withdrawDraftKey = "withdraw";
const withdrawModelKey = "withdrawModel";
