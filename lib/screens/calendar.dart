import 'dart:convert';
import 'package:easy_school/components/calendar/event-model.dart';
import 'package:easy_school/components/calendar/events-container.dart';
import 'package:flutter/material.dart';
import 'package:easy_school/components/common/typography/index.dart';
import 'package:flutter/services.dart';

import '../components/calendar/events.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
            child: Wrap(spacing: 6, direction: Axis.vertical, children: const [
          CustomTypography(
            "Events",
            as: "TitleBold",
            color: Colors.black,
          ),
          EventsContainer()
        ])));
  }
}
