import 'package:easy_school/components/home-student/subject-model.dart';
import 'package:easy_school/components/home-student/subject.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

var subjects = [
  SubjectModel(
      image: "",
      label: "Telugu",
      totalTasks: 5,
      tasksCompleted: 10,
      subjectId: "23"),
  SubjectModel(
      image: "",
      label: "English",
      totalTasks: 5,
      tasksCompleted: 10,
      subjectId: "23"),
  SubjectModel(
      image: "",
      label: "Hindi",
      totalTasks: 5,
      tasksCompleted: 10,
      subjectId: "23"),
  SubjectModel(
      image: "",
      label: "Maths",
      totalTasks: 5,
      tasksCompleted: 10,
      subjectId: "23"),
  SubjectModel(
      image: "",
      label: "Science",
      totalTasks: 5,
      tasksCompleted: 10,
      subjectId: "23"),
  SubjectModel(
      image: "",
      label: "Social Studies",
      totalTasks: 5,
      tasksCompleted: 10,
      subjectId: "23"),
  SubjectModel(
      image: "",
      label: "Social Studies",
      totalTasks: 5,
      tasksCompleted: 10,
      subjectId: "23"),
  SubjectModel(
      image: "",
      label: "Social Studies",
      totalTasks: 5,
      tasksCompleted: 10,
      subjectId: "23"),
];

var colors = [
  Colors.green,
  Colors.amber,
  Colors.lime,
  Colors.blue,
  Colors.pink,
];

class Subjects extends StatelessWidget {
  const Subjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Subject(
            subject: subjects[index],
            color: colors[index % 5],
          );
        },
        itemCount: subjects.length,
        shrinkWrap: true,
      ),
    );
  }
}
