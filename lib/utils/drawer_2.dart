import 'package:flutter/material.dart';

class Drawer2 extends StatelessWidget {
  const Drawer2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const DrawerHeader(
          child: Text('My Drawer'),
        ),
        ListTile(
          title: const Text('Item 1'),
          onTap: () => Page1(),
        ),
        ListTile(
          title: const Text('Item 2'),
          onTap: () => Page1(),
        ),
        ListTile(
          title: const Text('Item 3'),
          onTap: () => Page1(),
        ),
      ],
    );
  }
}

class Page1 {}
