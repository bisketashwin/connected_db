import 'package:flutter/material.dart';

class MyDrawer1 extends StatefulWidget {
  @override
  _MyDrawer1State createState() => _MyDrawer1State();
}

class _MyDrawer1State extends State<MyDrawer1> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('My Drawer'),
          ),
          ListTile(
            title: Text('Item 1'),
            selected: _selectedIndex == 0,
            onTap: () => _onItemTapped(0),
          ),
          ListTile(
            title: Text('Item 2'),
            selected: _selectedIndex == 1,
            onTap: () => _onItemTapped(1),
          ),
          ListTile(
            title: Text('Item 3'),
            selected: _selectedIndex == 2,
            onTap: () => _onItemTapped(2),
          ),
        ],
      ),
    );
  }
}
