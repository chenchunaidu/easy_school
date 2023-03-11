import 'package:easy_school/components/common/typography/index.dart';
import 'package:easy_school/components/teacher-class/chapter.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class Chapter extends StatelessWidget {
  const Chapter({Key? key, required this.chapter}) : super(key: key);

  final ChapterModel chapter;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          GoRouter.of(context).push('/home/chapter-content');
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Row(children: [
            const Icon(
              Icons.book,
              size: 36,
            ),
            const SizedBox(
              width: 6,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomTypography("Chapter ${this.chapter.order}",
                  as: "SmallText"),
              SizedBox(
                width: MediaQuery.of(context).size.width - 74,
                child: CustomTypography(
                  this.chapter.name,
                  as: "BodyBold",
                ),
              ),
            ])
          ]),
        ));
  }
}
