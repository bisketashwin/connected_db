import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'home_sreen.dart';
// import '../utils/drawer_1.dart';
import '../utils/widgets.dart';

class Tab1 extends StatefulWidget {
  const Tab1({super.key, required this.title});

  final String title;

  @override
  State<Tab1> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Tab1> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          /////// welcome message
          WelcomeMessage(),
          AddCommodityCards2(),

          /// cards
        ],
      ),
    );
  }
}

class WelcomeMessage extends StatefulWidget {
  const WelcomeMessage({Key? key}) : super(key: key);

  @override
  _WelcomeMessageState createState() => _WelcomeMessageState();
}

class _WelcomeMessageState extends State<WelcomeMessage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Column(
        children: [
          RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.headlineMedium,
                children: [
                  const TextSpan(
                      text: 'Hi ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  WidgetSpan(
                      child: Icon(
                    Icons.waving_hand,
                    color: Theme.of(context).primaryColor,
                  )),
                  const TextSpan(text: '\n'),
                  const TextSpan(
                      text:
                          'welcone you can manage and trade commodities here!'),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: RichText(
              text: TextSpan(
                  // margin: const EdgeInsets.only(top: 10),
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: const [
                    TextSpan(
                        text:
                            'Add your commodity to ware house with help of our expert end to end service or by using our services when reqired at your comfort. get started')
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

class AddCommodityCards extends StatefulWidget {
  const AddCommodityCards({Key? key}) : super(key: key);

  @override
  _AddCommodityCardsState createState() => _AddCommodityCardsState();
}

class _AddCommodityCardsState extends State<AddCommodityCards> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 15, right: 20),
        children: const [
          AddCommodityCard1(
              icon: Icons.calculate,
              width: 300,
              header: '20 MT Spanish Cotton',
              bodyText:
                  'Moaterial is in transit will reach the ware house on 19th Sep'),
          AddCommodityCard1(
              icon: Icons.calculate,
              width: 300,
              header: '20 MT Spanish Cotton',
              bodyText:
                  'Moaterial is in transit will reach the ware house on 19th Sep'),
        ],
      ),
    );
  }
}

class AddCommodityCards2 extends StatefulWidget {
  const AddCommodityCards2({Key? key}) : super(key: key);

  @override
  _AddCommodityCards2State createState() => _AddCommodityCards2State();
}

class _AddCommodityCards2State extends State<AddCommodityCards2> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.0,
      child: ListView(
        // scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 15, right: 20),
        children: const [
          AddCommodityCard2(
              inOut: 'out',
              // width: 300,
              header: '20 MT Spanish Cotton',
              bodyText:
                  'Moaterial is in transit will reach the ware house on 19th Sep'),
          AddCommodityCard2(
              inOut: 'in',
              // width: 300,
              header: '20 MT Spanish Cotton',
              bodyText:
                  'Moaterial is in transit will reach the ware house on 19th Sep'),
        ],
      ),
    );
  }
}
