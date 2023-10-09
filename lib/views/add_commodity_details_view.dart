import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material3_app/utils/models/models.dart';
import 'package:material3_app/utils/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../utils/commonactions/common_actions.dart';

class AddCommodityDetailsView extends StatefulWidget {
  final int index;

  const AddCommodityDetailsView({
    Key? key,
    this.index = 2,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<AddCommodityDetailsView> {
  // late List<CommodityTicket> commodityTickets = widget.commodityTickets;
  // late int index = widget.index;
  final int index = Get.arguments['index']; // this is getX implementation

  bool showDetails = true;
  @override
  Widget build(BuildContext context) {
    return addCommDetails(context, this);
  }

  Widget addCommDetails(context, state) {
    List<CommodityTicket> commodityTickets =
        Provider.of<CommodityTicketController>(context).commodityTickets;
    int index = state.index;
    List<FarmAddress> farmAddresses =
        Provider.of<FarmAddressController>(context).farmAddresses;
    List<WarehouseAddress> warehouseAddresses =
        Provider.of<WarehouseAddressController>(context).warehouseAddresses;
    List<CommodityOwner> commodityOwners =
        Provider.of<CommodityOwnerController>(context).commodityOwners;
    List<User> users = Provider.of<UserController>(context).users;

    if (commodityTickets != []) {
      /////////////////

      var commodityTicket = commodityTickets[index];

      var ownerId = commodityTicket.commodityOwnerId;
      var pickupId = commodityTicket.pickUpAddressId;
      var destId = commodityTicket.destinationAddressId;
      var userId = commodityTicket.destinationAddressId;

      CommodityOwner comOwner = commodityOwners
          .firstWhere((commodityOwner) => commodityOwner.id == ownerId);
      FarmAddress pickAd =
          farmAddresses.firstWhere((address) => address.id == pickupId);
      WarehouseAddress destAd =
          warehouseAddresses.firstWhere((address) => address.id == destId);
      User user = users.firstWhere((user) => user.id == userId);

      ///////////
      var color1 = Theme.of(context).colorScheme.onBackground.withOpacity(0.6);
      var defaultTextStyle = Theme.of(context).textTheme.bodySmall;

      return Scaffold(
        appBar: AppBar(
          title: Text('Commodity Details'),
        ),
        body: Center(
          child: InkWell(
            onTap: () {
              // showDetails = !showDetails;
              // debugPrint('showDetails = $showDetails');
              // setState(() {});
            },
            child: Card(
              child: Column(
                children: [
                  topBannerStatus(
                    context: context,
                    status: 1,
                    timeString: DateFormat('  d MMM yyyy')
                        .format(commodityTicket.pickupDate),
                  ),
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
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      getGcommodityThumb(
                                          name: commodityTicket.commodity),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${commodityTicket.commodity}  ${commodityTicket.quantity}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      Text('Owner: ${comOwner.firmName}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                      Row(
                                        children: [
                                          iconLabel(
                                            context: context,
                                            mainText:
                                                commodityTicket.ticketNumber,
                                            textSize: 'bodyMedium',
                                            color: color1,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          iconLabel(
                                            context: context,
                                            mainText:
                                                '${commodityTicket.transportType} Transport',
                                            textSize: 'bodyMedium',
                                            color: color1,
                                            type: 'Transport',
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: showDetails,
                                child: Text(
                                    'Job Created by \n${user.name}  ${user.phoneNumbers}'),
                              ),
                              const Divider(),
                              Visibility(
                                visible: !showDetails,
                                child: Text(
                                  'Pick up - ${pickAd.firmName}, ${pickAd.villageOrTaluk}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),

                              Visibility(
                                visible: showDetails,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Pick up - ${pickAd.villageOrTaluk}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    Text(pickAd.firmName),
                                    Text(pickAd.street),
                                    // Text(pickAd.villageOrTaluk),
                                    Text(
                                        '${pickAd.zilla}, ${pickAd.state} - ${pickAd.pincode}'),
                                  ],
                                ),
                              ),
                              //Text(pickAd.state),

                              const Divider(),
                              Visibility(
                                visible: !showDetails,
                                child: Text(
                                  'Destination - ${destAd.firmName}, ${destAd.villageOrTaluk}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),

                              Visibility(
                                visible: showDetails,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Destination - ${destAd.villageOrTaluk}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
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
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Commodity Details'),
        ),
        body: Center(
            child: Container(
          child: Text('nothing to show'),
        )),
      );
    }
  }
}