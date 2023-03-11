import 'package:easy_school/components/teacher-class/chapter.dart';
import 'package:easy_school/components/teacher-class/chapter.model.dart';
import 'package:flutter/widgets.dart';

var chapters = [
  ChapterModel(name: "Real number", order: 1),
  ChapterModel(name: "Polynomials", order: 2),
  ChapterModel(name: "Pair of Linear equations in two variables", order: 3),
  ChapterModel(name: "Quadratic equations", order: 4)
];

class Chapters extends StatelessWidget {
  const Chapters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: chapters.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Chapter(chapter: chapters[index]);
        });
  }
}
