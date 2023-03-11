import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jiffy/jiffy.dart';

class ProfileModel {
  final String name;
  final String? schoolName;
  final String? className;
  final String? profileImage;

  ProfileModel(
      {required this.name, this.schoolName, this.className, this.profileImage});

  factory ProfileModel.formJson(Map<String, dynamic> json) {
    return ProfileModel(
        name: json["name"],
        schoolName: json["schoolName"],
        profileImage: json["profileImage"],
        className: json["className"]);
  }
}
