import 'package:flutter/material.dart';

Widget myTabBar() {
  return TabBar(
    unselectedLabelColor: Colors.redAccent,
    indicatorSize: TabBarIndicatorSize.label,
    indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(50), color: Colors.redAccent),
    tabs: [
      Tab(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.redAccent, width: 1)),
          child: Align(
            alignment: Alignment.center,
            child: Text("APPS"),
          ),
        ),
      ),
      Tab(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.redAccent, width: 1)),
          child: Align(
            alignment: Alignment.center,
            child: Text("MOVIES"),
          ),
        ),
      ),
    ],
  );
}
