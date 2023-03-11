import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_school/components/calendar/event-model.dart';
import 'package:easy_school/components/calendar/events.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../services/app-service.dart';

class EventsContainer extends StatefulWidget {
  const EventsContainer({Key? key}) : super(key: key);

  @override
  _EventsContainerState createState() => _EventsContainerState();
}

class _EventsContainerState extends State<EventsContainer> {
  CollectionReference eventsCollection =
      FirebaseFirestore.instance.collection('events');

  @override
  Widget build(BuildContext context) {
    var student = Provider.of<AppService>(context).student;
    return FutureBuilder(
      future: eventsCollection
          .where("classId", isEqualTo: student!["classId"])
          .where("endTime", isGreaterThan: DateTime.now())
          .get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && snapshot.data!.size == 0) {
          return Text("No Tasks exists for today");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("loading");
        }

        List<EventModel> events = snapshot.data!.docs.map((doc) {
          var data = doc.data() as Map<String, dynamic>;
          return EventModel.formJson(data);
        }).toList();
        return Events(events: events);
      },
    );
  }
}
