import 'package:easy_school/components/calendar/event-model.dart';
import 'package:easy_school/components/calendar/event.dart';
import 'package:flutter/cupertino.dart';

class Events extends StatelessWidget {
  const Events({Key? key, required this.events}) : super(key: key);

  final List<EventModel> events;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width - 36,
        child: ListView.builder(
            itemCount: events.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return EventComp(
                event: events[index],
              );
            }));
  }
}
