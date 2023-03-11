import 'package:easy_school/components/common/typography/index.dart';
import 'package:easy_school/components/home-teacher/subject-class.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class ClassContainer extends StatelessWidget {
  const ClassContainer({Key? key, required this.color, required this.label})
      : super(key: key);

  final MaterialColor color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          GoRouter.of(context).push("/home/teacher-class");
          //
        },
        child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 20),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Icon(
                Icons.group,
                size: 36,
                color: color.shade900,
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTypography(
                    label,
                    as: "BodyBold",
                    color: color.shade900,
                  ),
                  CustomTypography(
                    label,
                    as: "SmallText",
                    color: color.shade700,
                  ),
                ],
              )
            ])));
  }
}
