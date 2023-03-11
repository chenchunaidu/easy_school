import 'package:easy_school/components/common/typography/index.dart';
import 'package:easy_school/components/home-teacher/class-container.dart';
import 'package:easy_school/components/home-teacher/subject-class.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SubjectClass extends StatelessWidget {
  const SubjectClass(
      {Key? key, required this.subjectClass, required this.color})
      : super(key: key);

  final SubjectClassModel subjectClass;
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color.shade100,
      ),
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTypography(
            subjectClass.subjectName,
            as: "Header3",
            color: color.shade900,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ClassContainer(
                  color: color, label: subjectClass.classes[index].name);
            },
            itemCount: subjectClass.classes.length,
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }
}
