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
              true, //TODO: these 3 are super critical properties for nested lsit views to wrok
          children: [
            ListView.builder(
              shrinkWrap:
                  true, //TODO:  these 3 are super critical properties for nested lsit views to wrok
              primary:
                  false, //TODO:  these 3 are super critical properties for nested lsit views to wrok
              itemCount: commodityTickets.length,
              itemBuilder: (context, index) {
                // return Text(commodityTickets[index].companyName);
                return commodityTicketCard(context, commodityTickets, index);
              },
            ),
            CardWithBanner(context),
          ],
        ),
      ),
    );
  }
}

Widget commodityTicketCard(context, commodityTickets, index) {
  var commodityTicket = commodityTickets[index];
  var pickAd = commodityTicket.pickUpAddress;
  var destAd = commodityTicket.destinationAddress;
  var color1 = Theme.of(context).colorScheme.onBackground.withOpacity(0.6);
  var defaultTextStyle = Theme.of(context).textTheme.bodySmall;
  return Card(
    child: Column(
      children: [
        topBannerStatus(context, 1),
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 5),
          child: Column(
            children: [
              DefaultTextStyle(
                style: defaultTextStyle!,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ticket Number',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: FaIcon(
                              FontAwesomeIcons.ticket,
                              size: 20,
                              color: color1,
                            ),
                          ),
                          TextSpan(
                            text: ' ${commodityTicket.ticketNumber}',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: color1,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${commodityTicket.commodity}  ${commodityTicket.quantity}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(commodityTicket.commodityOwner.firmName,
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text(
                        'Job Created by \n${commodityTicket.contactPerson} ( ${commodityTicket.phoneNumber} )'),

                    Divider(),
                    Text(
                      'Pick up point - ${pickAd.villageOrTaluk}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(pickAd.firmName),
                    Text(pickAd.street),
                    // Text(pickAd.villageOrTaluk),
                    Text(
                        '${pickAd.zilla}, ${pickAd.state} - ${pickAd.pincode}'),
                    //Text(pickAd.state),

                    Text(
                      '${DateFormat('h:mm a  --  d MMM yyyy').format(commodityTicket.pickupDate)}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Divider(),
                    Text(
                      'Destination - ${destAd.villageOrTaluk}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(destAd.firmName),
                    Text(destAd.street),
                    // Text(destAd.villageOrTaluk),
                    Text('${destAd.zilla}, ${destAd.state} -${destAd.pincode}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget CardWithBanner(BuildContext context) {
  var color1 = Theme.of(context).colorScheme.onBackground.withOpacity(0.6);
  return Container(
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
          SizedBox(
            height: 100,
          )
        ],
      ),
    ),
  );
}

Widget topBannerStatus(BuildContext context, int status) {
  var color1 = Theme.of(context).colorScheme.onBackground.withOpacity(0.6);
  // var color2 = Theme.of(context).extension<CustomColors>()!.sourceCustomcolor3;
  Color colorNotStarted = Color(0xFF787878);
  Color colorInProgress = Color(0xFFFFC268);
  Color colorNeedAttention = Color(0xFFE24646);
  Color colorCompleted = Color(0xFF46E27D);

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
