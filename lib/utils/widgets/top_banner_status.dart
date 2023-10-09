import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../constants/constants_1.dart';

Widget topBannerStatus(
    {required context,
    required int status,
    timeString = '',
    textStle = 'bodySmall',
    noRound = false}) {
  var color1 = Theme.of(context).colorScheme.onBackground.withOpacity(0.6);
  // var color2 = Theme.of(context).extension<CustomColors>()!.sourceCustomcolor3;

  Color statusColor;
  IconData statusIcon;
  String statusMessage;
  TextStyle defaultTextStyle;
  Radius borderRadius =
      noRound ? const Radius.circular(0) : const Radius.circular(12.0);

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

  switch (textStle) {
    case 'bodyMedium':
      defaultTextStyle = Theme.of(context).textTheme.bodyMedium!;
      break;
    case 'bodyLarge':
      defaultTextStyle = Theme.of(context).textTheme.bodyLarge!;
      break;
    default:
      defaultTextStyle = Theme.of(context).textTheme.bodySmall!;
  }

  return DefaultTextStyle(
    style: defaultTextStyle,
    child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 30,
        decoration: BoxDecoration(
          color: statusColor,
          borderRadius: BorderRadius.only(
            topLeft: borderRadius,
            topRight: borderRadius,
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
            ),
          ],
        )
        // widget goes here
        ),
  );
}
