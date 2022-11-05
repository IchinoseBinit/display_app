import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/components/auth_template.dart';
import '/components/password_field.dart';
import '/utils/navigate.dart';
import '/utils/validation_mixin.dart';
import '/widgets/body_template.dart';
import '/widgets/general_elevated_button.dart';
import '/widgets/general_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final ssidController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(
    BuildContext context,
  ) {
    // if (kDebugMode) {
    //   phoneNumberController.text = "9804350997";
    //   passwordController.text = "Admin@123";
    // }

    return WillPopScope(
      onWillPop: () async {
        // return navigateAndRemoveAll(context, WelcomeScreen());
        return Future.value(true);
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          body: SafeArea(
            child: BodyTemplate(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AuthTemplate(
                      title: "Sign In",
                      description: "Please enter your details",
                    ),
                    // GeneralTextField(
                    //   labelText: localizations.ssfid,
                    //   controller: ssidController,
                    //   obscureText: false,
                    //   textInputType: TextInputType.text,
                    //   validate: (val) =>
                    //       ValidationMixin(context).validateSSFID(val),
                    //   textInputAction: TextInputAction.next,
                    // ),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    GeneralTextField(
                      labelText: "Email",
                      controller: phoneNumberController,
                      obscureText: false,
                      textInputType: TextInputType.phone,
                      validate: (val) => ValidationMixin().validateEmail(val),
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    PasswordField(
                      controller: passwordController,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          // navigate(context, ForgetPasswordScreen());
                        },
                        child: Text(
                          "Forgot password?",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    GeneralElevatedButton(
                      title: "Sign In",
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {}
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        GestureDetector(
                          onTap: () {
                            // navigate(context, const RegisterScreen());
                          },
                          child: Text(
                            "Sign Up",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).primaryColor,
                                    ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
