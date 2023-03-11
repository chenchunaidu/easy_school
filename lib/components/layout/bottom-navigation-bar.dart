import 'package:easy_school/components/common/typography/index.dart';
import 'package:easy_school/components/layout/app-bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  const ScaffoldWithNavBarTabItem(
      {required this.initialLocation,
      required Widget icon,
      String? label,
      Color? backgroundColor})
      : super(icon: icon, label: label, backgroundColor: backgroundColor);
  final String initialLocation;
}

const tabs = [
  ScaffoldWithNavBarTabItem(
      initialLocation: "/home", icon: Icon(Icons.home_filled), label: 'Home'),
  ScaffoldWithNavBarTabItem(
      initialLocation: "/content", icon: Icon(Icons.book), label: 'Content'),
  ScaffoldWithNavBarTabItem(
    initialLocation: "/calendar",
    icon: Icon(Icons.calendar_month_outlined),
    label: 'Calendar',
  ),
  ScaffoldWithNavBarTabItem(
      initialLocation: "/profile",
      icon: Icon(Icons.account_circle_outlined),
      label: 'Profile'),
];

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar({Key? key, required this.child})
      : super(key: key);
  final Widget child;

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  int _locationToTabIndex(String location) {
    final index =
        tabs.indexWhere((t) => location.startsWith(t.initialLocation));
    return index < 0 ? 0 : index;
  }

  void _onItemTapped(BuildContext context, int tabIndex) {
    context.go(tabs[tabIndex].initialLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(height: 50, child: Container()),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.shade500,
        items: tabs,
        currentIndex: _currentIndex,
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }
}
