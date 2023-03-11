import 'dart:ffi';

import 'package:easy_school/components/common/typography/index.dart';
import 'package:easy_school/components/teacher-class/chapters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TeacherClass extends StatelessWidget {
  const TeacherClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomTypography(
              "Class X - Maths",
              as: "TitleBold",
            ),
            SizedBox(height: 12),
            Chapters()
          ],
        ));
  }
}
