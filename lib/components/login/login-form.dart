import 'package:easy_school/components/common/typography/index.dart';
import 'package:flutter/material.dart';

typedef OnSendVerificationCode = void Function(String phoneNo);

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key, required this.onSendVerificationCode})
      : super(key: key);

  final OnSendVerificationCode onSendVerificationCode;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberEditingController = TextEditingController();

  void onSubmit() {
    widget.onSendVerificationCode("+91${phoneNumberEditingController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomTypography("Phone number", as: "BodyBold", color: Colors.white),
          const SizedBox(height: 10),
          TextFormField(
            controller: phoneNumberEditingController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(fillColor: Colors.white),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter phone number';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black),
                  onPressed: onSubmit,
                  child: CustomTypography("Submit")))
        ]));
  }
}
