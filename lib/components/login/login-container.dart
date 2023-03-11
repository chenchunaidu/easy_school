import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'auth-info.dart';
import 'login-form.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({Key? key, required this.onSendVerificationCode})
      : super(key: key);

  final OnSendVerificationCode onSendVerificationCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.black,
            padding: EdgeInsets.all(16.0),
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const AuthInfo(),
                  const SizedBox(
                    height: 60,
                  ),
                  LoginForm(
                    onSendVerificationCode: onSendVerificationCode,
                  )
                ]))));
  }
}
