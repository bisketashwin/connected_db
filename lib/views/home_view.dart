import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material3_app/utils/controllers/commodity_ticket_controller.dart';
import 'package:material3_app/views/tab_1_view.dart';
import 'package:material3_app/views/tab_2_view.dart';
import 'package:material3_app/utils/drawer_1.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentPageIndex = 0;

  // Get the CommodityTicketController instance.
  // CommodityTicketController commodityTicketController =
  //     Get.put(CommodityTicketController());

  // Create a variable to store the Get.lazyPut() callback function.
  final commodityTicketController = Get.put(CommodityTicketController());

  // Declare the Tab2 widget variable outside of the GetX builder.
  late Tab2 tab2;

  @override
  void initState() {
    super.initState();

    // Create the Tab2 widget and pass the commodityTicketControllerProvider variable to it as a named argument.
    tab2 = Tab2(
      title: 'some more widgets',
      commodityTicketController: commodityTicketController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetX<CommodityTicketController>(
      builder: (commodityTicketController) {
        return Scaffold(
          drawerEnableOpenDragGesture: true,
          extendBodyBehindAppBar: true,
          drawer: MyDrawer1(),
          appBar: AppBar(
            elevation: 0,
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            scrolledUnderElevation: 0,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.person_2),
                  padding: EdgeInsets.only(left: 10),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
          ),
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            // indicatorColor: Colors.amber[800],
            selectedIndex: currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.business),
                icon: Icon(Icons.business_outlined),
                label: 'Business',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.school),
                icon: Icon(Icons.school_outlined),
                label: 'School',
              ),
            ],
          ),
          body: <Widget>[
            const Tab1(title: 'Flutter Demo Home Page'),
            tab2,
            Container(
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text('Page 3'),
            ),
          ][currentPageIndex],
        );
      },
    );
  }
}
