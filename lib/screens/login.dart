import 'package:easy_school/components/login/auth-info.dart';
import 'package:easy_school/components/login/login-form.dart';
import 'package:easy_school/screens/otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../components/login/login-container.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth auth = FirebaseAuth.instance;
  var codeSent = false;
  late String verificationId;
  late int? resendToken;

  void onVerificationCompleted(PhoneAuthCredential credential) async {
    await auth.signInWithCredential(credential);
  }

  void onVerificationFailed(FirebaseAuthException e) async {
    //TODO: Handle error
    print(FirebaseAuthException);
  }

  void onCodeAutoRetrievalTimeout(String verId) async {
    setState(() {
      verificationId = verId;
    });
  }

  void onCodeSent(String verId, int? rT) async {
    setState(() {
      codeSent = true;
      verificationId = verId;
      resendToken = rT;
    });
  }

  void onSendCode(String phoneNumber) async {
    await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: onVerificationCompleted,
        codeAutoRetrievalTimeout: onCodeAutoRetrievalTimeout,
        codeSent: onCodeSent,
        verificationFailed: onVerificationFailed);
  }

  void verifyOTP(String code) async {
    if (verificationId != null) {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId ?? '', smsCode: code);

      try {
        await auth.signInWithCredential(credential);
      } catch (e) {
        // TODO: Handle error
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return codeSent
        ? OTP(
            onVerifyOTP: (code) {
              verifyOTP(code);
            },
          )
        : LoginContainer(onSendVerificationCode: onSendCode);
  }
}
