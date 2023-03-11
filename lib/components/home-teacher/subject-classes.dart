import 'package:easy_school/components/home-student/subject-model.dart';
import 'package:easy_school/components/home-student/subject.dart';
import 'package:easy_school/components/home-teacher/subject-class.dart';
import 'package:easy_school/components/home-teacher/subject-class.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

var subjectClasses = [
  SubjectClassModel(
    subjectName: "Maths",
    classes: [
      ClassModel(name: "Class X"),
      ClassModel(name: "Class IX"),
      ClassModel(name: "Class VIII")
    ],
  ),
  SubjectClassModel(
    subjectName: "Science",
    classes: [ClassModel(name: "Class VIII")],
  )
];

var colors = [
  Colors.teal,
  Colors.amber,
  Colors.lime,
  Colors.blue,
  Colors.pink,
];

class SubjectClasses extends StatelessWidget {
  const SubjectClasses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return SubjectClass(
            subjectClass: subjectClasses[index],
            color: colors[index],
          );
        },
        itemCount: subjectClasses.length,
        shrinkWrap: true,
      ),
    );
  }
}
