import 'package:easy_school/components/common/typography/index.dart';
import 'package:easy_school/components/home-student/add-subject.dart';
import 'package:easy_school/components/home-student/profile-section.dart';
import 'package:flutter/material.dart';

import '../components/home-student/avatars-container.dart';
import '../components/home-student/subjects.dart';
import '../components/home-student/week-calendar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime findFirstDateOfTheWeek(DateTime dateTime) {
    return dateTime
        .subtract(Duration(days: dateTime.weekday % DateTime.daysPerWeek));
  }

  DateTime findLastDateOfTheWeek(DateTime dateTime) {
    return dateTime.add(Duration(
        days:
            DateTime.daysPerWeek - (dateTime.weekday % DateTime.daysPerWeek)));
  }

  List<DateTime> getCurrentWeekInterval() {
    var startDate = findFirstDateOfTheWeek(DateTime.now());
    var endDate = findLastDateOfTheWeek(DateTime.now());
    List<DateTime> days = [];
    for (int i = 0; i < endDate.difference(startDate).inDays; i++) {
      var newDate = startDate.add(Duration(days: i));
      days.add(newDate);
    }
    return days;
  }

  late final weekDates = getCurrentWeekInterval();
  final currentDate = DateTime.now();

  var _selectedIndex = 0;

  void onSelectedDate(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void initState() {
    super.initState();
    var startDate = findFirstDateOfTheWeek(currentDate);
    onSelectedDate(currentDate.difference(startDate).inDays);
  }

  void showMyBottomSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AddSubject();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          padding: EdgeInsets.symmetric(horizontal: 2),
          color: Colors.white,
          child: SingleChildScrollView(
              child: Column(
            children: [
              const ProfileSection(
                label: "Hey Emily",
                subLabel: "Let’s get started with today’s fun homework",
                profileURL:
                    "https://static.wikia.nocookie.net/twilightsaga/images/f/fd/Mackenzielapremiere.jpg/revision/latest?cb=20121115034011",
              ),
              WeekCalendar(
                weekDates: weekDates,
                onSelectedDate: onSelectedDate,
                selectedIndex: _selectedIndex,
              ),
              Subjects()
            ],
          ))),
      Positioned(
        bottom: 16.0,
        right: 16.0,
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            showMyBottomSheet(context);
            // Perform some action
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    ]);
  }
}
