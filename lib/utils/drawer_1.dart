import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDrawer1 extends StatelessWidget {
  const MyDrawer1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        // backgroundColor: Theme.of(context).colorScheme.primary.withAlpha(192),
        child: Container(
      color: Theme.of(context).colorScheme.secondary,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('User Name'),
          ),
          ListTile(
            onTap: () => Page1(),
            leading: FaIcon(FontAwesomeIcons.solidAddressCard),
            title: Text('Your Profile Edit'),
          ),
          ListTile(
            onTap: () => Page1(),
            leading: FaIcon(FontAwesomeIcons.buildingWheat),
            title: Text('your Comapny'),
          ),
          ListTile(
            onTap: () => Page1(),
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          SizedBox(
            height: 50,
          ),
          ListTile(
            onTap: () {
              //
            },
            leading: FaIcon(FontAwesomeIcons.rightFromBracket),
            title: Text('Log Out'),
          )
        ],
      ),
    ));
  }
}

class Page1 {}
