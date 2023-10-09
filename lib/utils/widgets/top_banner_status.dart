import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../constants/constants_1.dart';

Widget topBannerStatus(
    {required context, required int status, timeString = ''}) {
  var color1 = Theme.of(context).colorScheme.onBackground.withOpacity(0.6);
  // var color2 = Theme.of(context).extension<CustomColors>()!.sourceCustomcolor3;

  Color statusColor;
  IconData statusIcon;
  String statusMessage;
  switch (status) {
    case 0:
      {
        statusColor = CommodityTicketStatus.notStarted.color;
        statusIcon = FontAwesomeIcons.circle;
        statusMessage = 'NOT STARTED YET';
      }
      break;

    case 1:
      {
        statusColor = CommodityTicketStatus.inProgress.color;
        statusIcon = FontAwesomeIcons.circleHalfStroke;
        statusMessage = 'IN PORGRESS';
      }
      break;
    case 2:
      {
        statusColor = CommodityTicketStatus.needsAttention.color;
        statusIcon = FontAwesomeIcons.circleExclamation;
        statusMessage = 'NEEDS YOUR ATTENTION';
      }
      break;

    default:
      {
        statusColor = CommodityTicketStatus.completed.color;
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
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            statusIcon,
            size: 16,
            color: color1,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            statusMessage,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            width: 10,
          ),
          FaIcon(
            FontAwesomeIcons.arrowRight,
            size: 16,
            color: color1,
          ),
          Text(
            '  ETA$timeString',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      )
      // widget goes here
      );
}
