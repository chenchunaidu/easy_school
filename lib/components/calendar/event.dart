import 'dart:math';

import 'package:easy_school/components/calendar/event-model.dart';
import 'package:easy_school/components/common/typography/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventComp extends StatelessWidget {
  const EventComp({Key? key, required this.event}) : super(key: key);

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Wrap(direction: Axis.vertical, spacing: 6, children: [
          CustomTypography(
            event.startTime ?? "",
            color: Colors.white70,
            as: "SmallTextBold",
          ),
          Wrap(
            direction: Axis.vertical,
            spacing: 2,
            children: [
              CustomTypography(
                event.title,
                color: Colors.white,
                as: "BodyBold",
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width - 36,
                  child: CustomTypography(
                    event.description ?? '',
                    color: Colors.white60,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    as: "SmallText",
                  )),
            ],
          ),
          CustomTypography(
            event.endTime ?? "",
            color: Colors.white70,
            as: "SmallTextBold",
          ),
        ]));
  }
}
