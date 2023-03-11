import 'package:easy_school/components/login/login-form.dart';
import 'package:easy_school/components/otp/otp-form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef OnVerifyOTP = void Function(String code);

class OTP extends StatelessWidget {
  const OTP({Key? key, required this.onVerifyOTP}) : super(key: key);

  final OnVerifyOTP onVerifyOTP;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        OtpForm(
          onVerifyOTP: onVerifyOTP,
        )
      ]),
    ));
  }
}
