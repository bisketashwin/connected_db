import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            icon: Icon(Icons.calendar_view_day)),
        ButtonSegment<Calendar>(
            value: Calendar.week,
            label: Text('Week', style: Theme.of(context).textTheme.bodySmall),
            icon: Icon(Icons.calendar_view_week)),
        ButtonSegment<Calendar>(
            value: Calendar.month,
            label: Text('Month', style: Theme.of(context).textTheme.bodySmall),
            icon: Icon(Icons.calendar_view_month)),
        ButtonSegment<Calendar>(
            value: Calendar.year,
            label: Text('Year', style: Theme.of(context).textTheme.bodySmall),
            icon: Icon(Icons.calendar_today)),
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

  AddCommodityCard1({
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
                  SizedBox(width: 10.0),
                  // Header
                  Text(header, style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
              SizedBox(height: 10.0),
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
  AddCommodityCard2({
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
            SizedBox(width: 10.0),
            Expanded(
              child: Center(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(header,
                          style: Theme.of(context).textTheme.titleSmall),
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
            ),
          ],
        ),
      ),
    );
  }
}
