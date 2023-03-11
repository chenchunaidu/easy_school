import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jiffy/jiffy.dart';

String stringFmt = "do MMM h:mm";

class EventModel {
  final String title;
  final String? description;
  final String? startTime;
  final String? endTime;

  EventModel({
    required this.title,
    this.description,
    this.startTime,
    this.endTime,
  });

  factory EventModel.formJson(Map<String, dynamic> json) {
    var startTimeStrV = json["startTime"] as Timestamp;
    var endTimeStrV = json["endTime"] as Timestamp;

    var startTimeV = Jiffy(startTimeStrV.toDate()).format(stringFmt);
    var endTimeV = Jiffy(endTimeStrV.toDate()).format(stringFmt);
    ;

    return EventModel(
        title: json["title"],
        description: json["description"],
        startTime: startTimeV,
        endTime: endTimeV);
  }
}
