import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Calendar { day, week, month, year }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      segments: <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
            value: Calendar.day,
            label: Text(
              'Day',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            icon: const Icon(Icons.calendar_view_day)),
        ButtonSegment<Calendar>(
            value: Calendar.week,
            label: Text('Week', style: Theme.of(context).textTheme.bodySmall),
            icon: const Icon(Icons.calendar_view_week)),
        ButtonSegment<Calendar>(
            value: Calendar.month,
            label: Text('Month', style: Theme.of(context).textTheme.bodySmall),
            icon: const Icon(Icons.calendar_view_month)),
        ButtonSegment<Calendar>(
            value: Calendar.year,
            label: Text('Year', style: Theme.of(context).textTheme.bodySmall),
            icon: const Icon(Icons.calendar_today)),
      ],
      selected: <Calendar>{calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          calendarView = newSelection.first;
        });
      },
    );
  }
}

enum Sizes { extraSmall, small, medium, large, extraLarge }

class MultipleChoice extends StatefulWidget {
  const MultipleChoice({super.key});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Sizes>(
      segments: <ButtonSegment<Sizes>>[
        ButtonSegment<Sizes>(
            value: Sizes.extraSmall,
            label: Text('XS', style: Theme.of(context).textTheme.bodySmall)),
        ButtonSegment<Sizes>(
            value: Sizes.small,
            label: Text('S', style: Theme.of(context).textTheme.bodySmall)),
        ButtonSegment<Sizes>(
            value: Sizes.medium,
            label: Text('M', style: Theme.of(context).textTheme.bodySmall)),
        ButtonSegment<Sizes>(
            value: Sizes.large,
            label: Text('L', style: Theme.of(context).textTheme.bodySmall)),
        ButtonSegment<Sizes>(
            value: Sizes.extraLarge,
            label: Text('XL', style: Theme.of(context).textTheme.bodySmall)),
      ],
      selected: selection,
      onSelectionChanged: (Set<Sizes> newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: true,
    );
  }
}

class AddCommodityCard1 extends StatelessWidget {
  final IconData icon;
  final String header;
  final String bodyText;
  final double width;

  const AddCommodityCard1({
    super.key,
    required this.icon,
    required this.header,
    required this.bodyText,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Card(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon
              Row(
                children: [
                  Icon(icon, size: 30.0),
                  const SizedBox(width: 10.0),
                  // Header
                  Text(header, style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
              const SizedBox(height: 10.0),
              // Body text
              Text(bodyText, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}

class AddCommodityCard2 extends StatelessWidget {
  // final IconData icon;

  final String header;
  final String bodyText;
  // final double width;
  final String inOut;
  const AddCommodityCard2({
    super.key,
    // required this.icon,
    required this.inOut,
    required this.header,
    required this.bodyText,
    // required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Column(
              children: [
                SvgPicture.asset(
                  () {
                    if (inOut == "in") {
                      return 'lib/assets/icons_designed/commodity_inward.svg';
                    } else if (inOut == "out") {
                      return 'lib/assets/icons_designed/commodity_outward.svg';
                    } else {
                      // Add more conditions and return statements as needed.
                      // You can also have a default case if none of the conditions match.
                      //return 'lib/assets/icons_designed/default.svg';
                      return 'lib/assets/icons_designed/commodity_outward.svg';
                    }
                  }(),
                  width: 50,
                  height: 50,
                ),
                // Icon(icon, size: 40.0),
              ],
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(header, style: Theme.of(context).textTheme.titleSmall),
                    Text(
                      bodyText,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 1, // Allow unlimited lines
                      // textAlign: TextAlign.justify,
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
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

  //////////////////////
  switch (type) {
    case 'Date Time':
      myIcon = FontAwesomeIcons.calendarDay;
      break;
    case 'Transport':
      myIcon = FontAwesomeIcons.truck;
      break;
    default:
      // by default it 'Ticket Number'
      myIcon = FontAwesomeIcons.ticket;
  }

  ///////////
  switch (textSize) {
    case 'bodyMedium':
      style = Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: color,
          );
      iconSize = 16.0;
      break;
    case 'bodySmall':
      style = Theme.of(context).textTheme.bodySmall!.copyWith(
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
  ///////////////////////////
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
