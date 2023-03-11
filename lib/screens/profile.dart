import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_school/components/profile/profile-comp.dart';
import 'package:easy_school/components/profile/profile-model.dart';
import 'package:easy_school/services/app-service.dart';
import 'package:flutter/material.dart';
import 'package:easy_school/components/common/typography/index.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  CollectionReference users = FirebaseFirestore.instance.collection('students');
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AppService>(context).userState;
    // return Container(child: Text(user?.phoneNumber ?? ''));
    return StreamBuilder<QuerySnapshot>(
      stream: users.where("userId", isEqualTo: user?.uid).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && snapshot.data!.size == 0) {
          return Text("Profile does not exist");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("loading");
        }

        Map<String, dynamic> data =
            snapshot.data!.docs[0].data() as Map<String, dynamic>;
        return ProfileComp(profile: ProfileModel.formJson(data));
      },
    );
  }
}
