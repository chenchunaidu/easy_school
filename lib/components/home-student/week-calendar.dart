import 'package:easy_school/components/common/typography/index.dart';
import 'package:easy_school/components/home-student/week-day.dart';
import 'package:flutter/material.dart';

const weekDays = [
  "N",
  "Mon",
  "Tue",
  "Wed",
  "Thu",
  "Fri",
  "Sat",
  "Sun",
];

class WeekCalendar extends StatelessWidget {
  const WeekCalendar(
      {Key? key,
      required this.weekDates,
      required this.selectedIndex,
      required this.onSelectedDate})
      : super(key: key);

  final List<DateTime> weekDates;
  final int selectedIndex;
  final WeekDayTapCallback onSelectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: weekDates.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return WeekDay(
                date: weekDates[index],
                isSelected: selectedIndex == index,
                index: index,
                onSelectedDate: onSelectedDate,
              );
            }));
  }
}
