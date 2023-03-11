import 'package:easy_school/components/common/typography/index.dart';
import 'package:easy_school/components/home-student/subject-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Subject extends StatelessWidget {
  const Subject({Key? key, required this.subject, this.color})
      : super(key: key);

  final SubjectModel subject;
  final MaterialColor? color;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
            color: color!.shade50, borderRadius: BorderRadius.circular(6)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            children: [
              Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: color!.shade600,
                      borderRadius: BorderRadius.circular(4)),
                  child: const Icon(
                    Icons.public,
                    size: 36,
                    color: Colors.white,
                  )),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                CustomTypography(
                  subject.label,
                  as: "TitleBold",
                ),
                CustomTypography(
                  "${subject.tasksCompleted}/${subject.totalTasks}  completed",
                  as: "SmallText",
                  textAlign: TextAlign.start,
                )
              ])
            ],
          ),
          const Icon(
            Icons.keyboard_arrow_right,
            size: 42,
          )
        ]));
  }
}
