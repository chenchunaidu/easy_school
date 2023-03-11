import 'package:easy_school/components/common/image/image.dart';
import 'package:easy_school/components/common/typography/index.dart';
import 'package:flutter/material.dart';

class AuthInfo extends StatelessWidget {
  const AuthInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 12,
      alignment: WrapAlignment.center,
      children: [
        CustomImage(
            width: MediaQuery.of(context).size.width / 1.1,
            image: const NetworkImage(
                "https://firebasestorage.googleapis.com/v0/b/easy-school-92eb2.appspot.com/o/easy-school-login-image.png?alt=media&token=68a79db2-e691-4f5f-82d4-c187c2a9ffa0")),
        SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            child: const CustomTypography(
              "Welcome \nto Easy school",
              overflow: TextOverflow.ellipsis,
              as: "Header1",
              maxLines: 4,
              color: Colors.white,
            )),
        SizedBox(
            width: MediaQuery.of(context).size.width - 18,
            child: const CustomTypography(
                "Now you can be part of your child's learning journey",
                overflow: TextOverflow.ellipsis,
                as: "Body",
                maxLines: 4,
                color: Colors.white))
      ],
    );
  }
}
