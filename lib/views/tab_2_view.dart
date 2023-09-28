// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:material3_app/theme/custom_color.dart';
import '../utils/controllers/commodity_ticket_controller.dart';
import '../utils/models/commodity_ticket_model.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Tab2 extends StatefulWidget {
  final String title;

  const Tab2({Key? key, required this.title}) : super(key: key);

  @override
  State<Tab2> createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  @override
  Widget build(BuildContext context) {
    List<CommodityTicket> commodityTickets =
        Provider.of<CommodityTicketController>(context).commodityTickets;

    return Scaffold(
      backgroundColor:
          Theme.of(context).extension<CustomColors>()!.sourceCustomcolor2,
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: ListView(
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
                // return Text(commodityTickets[index].companyName);
                return commodityTicketCard(context, commodityTickets, index);
              },
            ),
            cardWithBanner(context),
          ],
        ),
      ),
    );
  }
}

Widget commodityTicketCard(context, commodityTickets, index) {
  bool showDetails = false;
  var commodityTicket = commodityTickets[index];
  var pickAd = commodityTicket.pickUpAddress;
  var destAd = commodityTicket.destinationAddress;
  var color1 = Theme.of(context).colorScheme.onBackground.withOpacity(0.6);
  var defaultTextStyle = Theme.of(context).textTheme.bodySmall;
  return Center(
    child: GestureDetector(
      onDoubleTap: () {
        showDetails = !showDetails;
        debugPrint('showDetails = $showDetails');
      },
      child: Card(
        child: Column(
          children: [
            topBannerStatus(context, 1),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 16, top: 5),
              child: Column(
                children: [
                  DefaultTextStyle(
                    style: defaultTextStyle!,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        iconLabel(
                          label: 'Ticket Number',
                          context: context,
                          mainText: commodityTicket.ticketNumber,
                          textSize: 'bodyMedium',
                          color: color1,
                        ),
                        Text(
                          '${commodityTicket.commodity}  ${commodityTicket.quantity}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(commodityTicket.commodityOwner.firmName,
                            style: Theme.of(context).textTheme.bodyLarge),
                        Visibility(
                          visible: showDetails,
                          child: Text(
                              'Job Created by \n${commodityTicket.contactPerson} ( ${commodityTicket.phoneNumber} )'),
                        ),
                        const Divider(),
                        Text(
                          'Pick up point - ${pickAd.villageOrTaluk}',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          DateFormat('h:mm a  --  d MMM yyyy')
                              .format(commodityTicket.pickupDate),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: color1),
                        ),
                        iconLabel(
                          label: 'Transport Provided by',
                          type: 'Transport',
                          context: context,
                          mainText: commodityTicket.transportType,
                          textSize: 'bodyMedium',
                          color: color1,
                        ),
                        Text(pickAd.firmName),
                        Text(pickAd.street),
                        // Text(pickAd.villageOrTaluk),
                        Text(
                            '${pickAd.zilla}, ${pickAd.state} - ${pickAd.pincode}'),
                        //Text(pickAd.state),

                        const Divider(),
                        Text(
                          'Destination - ${destAd.villageOrTaluk}',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(destAd.firmName),
                        Text(destAd.street),
                        // Text(destAd.villageOrTaluk),
                        Text(
                            '${destAd.zilla}, ${destAd.state} -${destAd.pincode}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget iconLabel(
    {String type = '',
    String label = '',
    required context,
    String mainText = '',
    required String textSize,
    required Color color}) {
  TextStyle style;
  double iconSize;
  IconData myIcon;
  switch (type) {
    case 'Date Time':
      myIcon = FontAwesomeIcons.calendarDay;
      style = Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: color,
          );
      iconSize = 20.0;
      break;
    case 'Transport':
      myIcon = FontAwesomeIcons.truck;
      style = Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: color,
          );
      iconSize = 20.0;
      break;
    default:
      // by default it 'Ticket Number'
      myIcon = FontAwesomeIcons.ticket;
      style = Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: color,
          );
      iconSize = 20.0;
  }
  switch (textSize) {
    case 'bodyMedium':
      style = Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: color,
          );
      iconSize = 16.0;
      break;
    case 'Transport':
      style = Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: color,
          );
      iconSize = 20.0;
      break;
    default:
      // by default it 'bodyLarge'
      style = Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: color,
          );
      iconSize = 20.0;
  }
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Visibility(
        visible: label == '' ? false : true,
        child: Text(label),
      ),
      RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: FaIcon(
                myIcon,
                size: iconSize,
                color: color,
              ),
            ),
            TextSpan(
              text: ' $mainText',
              style: style,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget cardWithBanner(BuildContext context) {
  // var color1 = Theme.of(context).colorScheme.onBackground.withOpacity(0.6);
  bool showDetails = false;
  return GestureDetector(
    onTap: () {
      showDetails = !showDetails;
      debugPrint('showDetails = $showDetails');
    },
    child: Card(
      color: Colors.orange,
      elevation: 10,
      // shadowColor: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          topBannerStatus(context, 1),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
                'This would be visible all time. showDetails = $showDetails'),
          ),
          Visibility(
            visible: showDetails,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child:
                  Text('This would show only if showDetails is $showDetails'),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget topBannerStatus(BuildContext context, int status) {
  var color1 = Theme.of(context).colorScheme.onBackground.withOpacity(0.6);
  // var color2 = Theme.of(context).extension<CustomColors>()!.sourceCustomcolor3;
  Color colorNotStarted = const Color(0xFF787878);
  Color colorInProgress = const Color(0xFFFFC268);
  Color colorNeedAttention = const Color(0xFFE24646);
  Color colorCompleted = const Color(0xFF46E27D);

  Color statusColor;
  IconData statusIcon;
  String statusMessage;
  switch (status) {
    case 0:
      {
        statusColor = colorNotStarted;
        statusIcon = FontAwesomeIcons.circle;
        statusMessage = 'NOT STARTED YET';
      }
      break;

    case 1:
      {
        statusColor = colorInProgress;
        statusIcon = FontAwesomeIcons.circleHalfStroke;
        statusMessage = 'IN PORGRESS';
      }
      break;
    case 2:
      {
        statusColor = colorNeedAttention;
        statusIcon = FontAwesomeIcons.circleExclamation;
        statusMessage = 'NEEDS YOUR ATTENTION';
      }
      break;

    default:
      {
        statusColor = colorCompleted;
        statusIcon = FontAwesomeIcons.circleCheck;
        statusMessage = 'TASK COMPLETED';
      }
      break;
  }

  return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 30,
      decoration: BoxDecoration(
        color: statusColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            statusIcon,
            size: 20,
            color: color1,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            statusMessage,
          ),
        ],
      )
      // widget goes here
      );
}
