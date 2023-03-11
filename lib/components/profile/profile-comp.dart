import 'package:easy_school/components/common/typography/index.dart';
import 'package:easy_school/components/profile/profile-model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileComp extends StatelessWidget {
  const ProfileComp({Key? key, required this.profile}) : super(key: key);

  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(profile.profileImage ?? ""),
        ),
        const SizedBox(height: 15),
        CustomTypography(
          profile.name,
          as: "Header3",
        ),
        CustomTypography(
          profile.className ?? "",
        ),
        CustomTypography(
          profile.schoolName ?? "",
        )
      ],
    );
  }
}
