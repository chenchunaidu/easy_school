import 'package:easy_school/components/common/image/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../common/typography/index.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection(
      {Key? key,
      required this.label,
      required this.subLabel,
      required this.profileURL})
      : super(key: key);

  final String label;
  final String subLabel;
  final String profileURL;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTypography(label, as: "Header3"),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: width * 0.75,
                  child: CustomTypography(subLabel, as: "SmallText"),
                )
              ]),
          CircleAvatar(
            backgroundImage: NetworkImage(profileURL),
            radius: 30,
          )
        ],
      ),
    );
  }
}
