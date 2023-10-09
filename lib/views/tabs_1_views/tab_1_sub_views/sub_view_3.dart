import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material3_app/theme/custom_color.dart';
import 'package:provider/provider.dart';

import '../../../utils/commonactions/common_actions.dart';
import '../../../utils/constants/constants_1.dart';
import '../../../utils/models/controllers.dart';
import '../../../utils/models/models.dart';
import '../../../utils/widgets/widgets.dart';

class SubSiew3 extends StatefulWidget {
  //final context;

  const SubSiew3({
    super.key,
  });

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<SubSiew3> {
  @override
  Widget build(BuildContext context) {
    List<CommodityTicket> commodityTickets =
        Provider.of<CommodityTicketController>(context).commodityTickets;
    return Scaffold(
      backgroundColor:
          Theme.of(context).extension<CustomColors>()!.sourceCustomcolor2,
      body: Padding(
        padding: EdgeInsets.only(left: 5, right: 5.0),
        child: ListView(
          // controller: scrollController,
          shrinkWrap:
              true, //NOTE: these 3 are super critical properties for nested lsit views to wrok
          children: [
            ListView.builder(
              shrinkWrap: true,

              ///NOTE:  these 3 are super critical properties for nested lsit views to wrok
              primary: false,

              ///NOTE:  these 3 are super critical properties for nested lsit views to wrok
              itemCount: commodityTickets.length,
              itemBuilder: (context, index) {
                return addCommodityMin1(
                    commodityTickets: commodityTickets, index: index);
              },
            ),
            // cardWithBanner(context, _showDetails),
          ],
        ),
      ),
    );
  }
}

Widget actionChips2(context) {
  // var color1 = CommodityTicketStatus.outward.color;
  var color2 = Theme.of(context).colorScheme.onPrimaryContainer.withAlpha(145);
  var color1 = Theme.of(context).colorScheme.secondary;
  var textStyle1 = Theme.of(context)
      .textTheme
      .bodySmall!
      .copyWith(color: color2, fontWeight: FontWeight.w700);

  return Padding(
    padding: const EdgeInsets.only(left: 10, bottom: 0),
    child: Row(
      children: [
        TextButton.icon(
          onPressed: () {
            // Perform some action
          },
          icon: Icon(
            Icons.call,
            color: color2,
            size: 20,
          ),
          label: Text(
            'CALL MANAGER',
            style: textStyle1,
          ),
        ),
        TextButton.icon(
          onPressed: () {
            // Perform some action
          },
          icon: Icon(
            Icons.list,
            color: color2,
            size: 20,
          ),
          label: Text(
            'OTHER ACTIONS',
            style: textStyle1,
          ),
        ),
      ],
    ),
  );
}
