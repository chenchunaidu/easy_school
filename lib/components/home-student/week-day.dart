import 'package:flutter/material.dart';
import '../common/typography/index.dart';

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

typedef WeekDayTapCallback = void Function(int index);

class WeekDay extends StatelessWidget {
  const WeekDay(
      {Key? key,
      required this.date,
      this.isSelected,
      required this.onSelectedDate,
      required this.index})
      : super(key: key);

  final DateTime date;
  final bool? isSelected;
  final int index;
  final WeekDayTapCallback onSelectedDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onSelectedDate(index),
        child: Container(
            width: (MediaQuery.of(context).size.width - 48) / 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isSelected ?? false ? Colors.black : Colors.grey.shade100,
            ),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(left: 6),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomTypography(
                date.day.toString(),
                as: "TitleBold",
                color: isSelected ?? false ? Colors.white : Colors.black,
              ),
              CustomTypography(
                weekDays[date.weekday],
                as: "Caption",
                color: isSelected ?? false ? Colors.white : Colors.black,
              )
            ])));
    ;
  }
}
