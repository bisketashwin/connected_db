import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Tab5 extends StatefulWidget {
  final VoidCallback showNavigation;
  final VoidCallback hideNavigation;

  const Tab5(
      {Key? key, required this.showNavigation, required this.hideNavigation})
      : super(key: key);

  @override
  State<Tab5> createState() => _Tab5State();
}

class _Tab5State extends State<Tab5> {
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
            child: Text("wow its working?"),
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
