import 'package:flutter/material.dart';

import '../../theme/custom_color.dart';

Widget myTabBar1({required context}) {
  return TabBar(
    labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.w600,
          // color: color,
        ),
    unselectedLabelColor:
        Theme.of(context).colorScheme.onPrimaryContainer.withAlpha(115),
    indicatorSize: TabBarIndicatorSize.label,
    isScrollable: true,
    indicatorPadding: EdgeInsets.zero,
    labelPadding: EdgeInsets.only(right: 5.0, left: 5.0),
    indicatorWeight: 4,
    dividerColor: Colors.transparent,
    padding: EdgeInsets.zero,
    tabs: <Widget>[
      Tab(
        child: Row(
          children: [
            Icon(Icons.arrow_downward_rounded),
            Text(
              'INWARD',
            )
          ],
        ),
      ),
      Tab(
        child: Row(
          children: [
            Icon(Icons.arrow_upward_rounded),
            Text(
              'OUTWARD',
            ),
          ],
        ),
      ),
    ],
  );
}
