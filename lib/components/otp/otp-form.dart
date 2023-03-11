import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import '../common/typography/index.dart';

typedef OnVerifyOTP = void Function(String code);

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key, required this.onVerifyOTP}) : super(key: key);

  final OnVerifyOTP onVerifyOTP;

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomTypography("OTP", as: "BodyBold", color: Colors.black),
          const SizedBox(height: 10),
          TextFormField(
            controller: phoneNumberEditingController,
            keyboardType: TextInputType.phone,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter OTP';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print(_formKey.currentState);
                      widget.onVerifyOTP(phoneNumberEditingController.text);
                    }
                  },
                  child: const CustomTypography(
                    "Submit",
                    color: Colors.white,
                  )))
        ]));
    ;
  }
}
