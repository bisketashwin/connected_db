import 'package:flutter/material.dart';

Widget myTabBar2({required context}) {
  return TabBar(
    tabs: <Widget>[
      Tab(
        child: Row(
          children: [
            Icon(Icons.arrow_downward_rounded),
            Text(
              'INWARD',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    // color: color,
                  ),
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
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    // color: color,
                  ),
            ),
          ],
        ),
      ),
    ],
  );
}
