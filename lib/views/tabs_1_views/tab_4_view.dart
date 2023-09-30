import 'package:flutter/material.dart';
import 'package:material3_app/utils/widgets/widgets.dart';

class Tab4 extends StatefulWidget {
  @override
  _Tab4State createState() => _Tab4State();
}

class _Tab4State extends State<Tab4> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        drawer: const MyDrawer1(),
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.person_2),
                padding: const EdgeInsets.only(left: 10),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          title: Row(
            children: [
              Expanded(
                // child: myTabBar2(context: context),
                child: myTabBar2(context: context),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    // Add your settings button functionality here
                  },
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("It's cloudy here"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
          ],
        ),
      ),
    );
  }
}

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

// appBar: AppBar(
//         elevation: 0,
//         shadowColor: Colors.transparent,
//         backgroundColor: Colors.transparent,
//         scrolledUnderElevation: 0,
        // leading: Builder(
        //   builder: (BuildContext context) {
        //     return IconButton(
        //       icon: const Icon(Icons.person_2),
        //       padding: const EdgeInsets.only(left: 10),
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //     );
        //   },
        // ),
//       ),