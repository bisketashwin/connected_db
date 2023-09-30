import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'tabs_1_views/tabs_1_views.dart';

class HomeView3 extends StatefulWidget {
  const HomeView3({Key? key}) : super(key: key);

  @override
  State<HomeView3> createState() => _HomeView3State();
}

class _HomeView3State extends State<HomeView3> {
  bool visible = true;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          Container(
            child: Center(
              child: Text("Fav"),
            ),
          ),
          HomeScreen(
            hideNavigation: hideNav,
            showNavigation: showNav,
          ),
          Tab5(
            hideNavigation: hideNav,
            showNavigation: showNav,
          ),
        ],
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
        height: visible ? 75 : 0,
        child: Wrap(
          children: [
            NavigationBar(
              onDestinationSelected: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              // indicatorColor: Colors.amber[800],
              selectedIndex: currentIndex,
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
          ],
        ),
      ),
    );
  }

  void hideNav() {
    setState(() {
      visible = false;
    });
  }

  void showNav() {
    setState(() {
      visible = true;
    });
  }
}

class HomeScreen extends StatefulWidget {
  final VoidCallback showNavigation;
  final VoidCallback hideNavigation;

  const HomeScreen(
      {Key? key, required this.showNavigation, required this.hideNavigation})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        widget.showNavigation();
      } else {
        widget.hideNavigation();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    scrollController.removeListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        widget.showNavigation();
      } else {
        widget.hideNavigation();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        controller: scrollController,
        children: [
          Container(
            color: Colors.red,
            height: 270,
          ),
          Container(
            color: Colors.blue,
            height: 200,
          ),
          Container(
            color: Colors.purple,
            height: 200,
          ),
          Container(
            color: Colors.green,
            height: 280,
          ),
        ],
      ),
    );
  }
}
