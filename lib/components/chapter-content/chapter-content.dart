import 'package:easy_school/components/chapter-content/content-model.dart';
import 'package:easy_school/components/common/typography/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

var content = [
  ContentModel(name: "Introduction", id: "1"),
  ContentModel(name: "Euclid’s Division Lemma", id: "2"),
  ContentModel(name: "The Fundamental Theorem of Arithmetic", id: "3"),
  ContentModel(name: "Revisiting Irrational Numbers", id: "4")
];

class ChapterContent extends StatelessWidget {
  const ChapterContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          CustomTypography(""),
          ListView.builder(
              shrinkWrap: true,
              itemCount: content.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: EdgeInsets.all(6),
                    child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context)
                              .push("/home/content/eT2wunqpy0jpYQyZocOo/edit");
                        },
                        child: Row(children: [
                          const Icon(
                            Icons.newspaper,
                            size: 36,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTypography("Section ${index + 1}",
                                  as: "SmallText"),
                              CustomTypography(content[index].name,
                                  as: "BodyBold")
                            ],
                          )
                        ])));
              })
        ],
      ),
    );
  }
}
